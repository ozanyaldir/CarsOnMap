//
//  MapViewModel.swift
//  CarsOnMap
//
//  Created by Ozan YALDIR on 27.11.2021.
//

import Foundation
import MapKit
import Moya

class MapViewModel: ObservableObject {
    private let requestResource: CarsRequestResourceProtocol = RequestResourceFactory.createCarRequestResource()
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 0, longitude: 0),
        span: MKCoordinateSpan(latitudeDelta: 0.4, longitudeDelta: 0.4)
    )
    @Published private(set) var annotations: [AnnotationViewModel] = []
    private(set) var apiCallError: APICallError?
    @Published var isFailed: Bool = false
    
    func getCarList(){
        isFailed = false
        requestResource.getCarsList { [unowned self] result in
            switch result{
            case .success(let cars):
                let annotationVMArray = cars.map(AnnotationViewModel.init)
                let coordinatesArray = annotationVMArray.map({$0.coordinate})
                DispatchQueue.main.async {
                    self.annotations = annotationVMArray
                    self.region = MKCoordinateRegion(
                        center: coordinatesArray.calculateCoordinatesArrayMidpoint(),
                        span: MKCoordinateSpan(latitudeDelta: 0.4, longitudeDelta: 0.4)
                    )
                    isFailed = false
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.apiCallError = error
                    isFailed = true
                }
            }
        }
    }
    
}

struct AnnotationViewModel: Identifiable{
    
    let car: Car
    
    var id: String{
        car.id
    }
    var name: String{
        car.name ?? "Undefined"
    }
    var modelName: String{
        car.modelName ?? "Undefined"
    }
    var carImageUrl: String?{
        car.carImageUrl
    }
    var coordinate: CLLocationCoordinate2D{
        car.coordinate
    }
}

