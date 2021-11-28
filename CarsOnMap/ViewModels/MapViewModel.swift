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
    private let requestResource = CarsRequestResource.init(provider: MoyaProvider<CodingTaskAPITarget>(plugins: [CachePolicyPlugin()]))
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 0, longitude: 0),
        span: MKCoordinateSpan(latitudeDelta: 0.4, longitudeDelta: 0.4)
    )
    @Published private(set) var annotations: [AnnotationViewModel] = []
    @Published private(set) var apiCallError: APICallError?
    @Published var isFailed: Bool = false
    
    func getCarList(){
        isFailed = false
        requestResource.getCarsList { [unowned self] result in
            switch result{
            case .success(let cars):
                let annotationVMArray = cars.map({AnnotationViewModel.init(car: $0)})
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
    
    let id: String
    let name: String?
    let modelName: String
    let carImageUrl: String?
    let coordinate: CLLocationCoordinate2D
    
    init(car: Car){
        self.id = car.id ?? UUID().uuidString
        self.modelName = car.modelName ?? "Undefined"
        self.name = car.name ?? "Undefined"
        self.carImageUrl = car.carImageUrl
        self.coordinate = CLLocationCoordinate2D(latitude: car.latitude!, longitude: car.longitude!)
    }
}

