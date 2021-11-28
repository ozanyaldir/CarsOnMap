//
//  MapViewModel.swift
//  CarsOnMap
//
//  Created by Ozan YALDIR on 27.11.2021.
//

import Foundation
import Moya
import MapKit
import ObjectMapper

class MapViewModel: ObservableObject {
    
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 0, longitude: 0),
        span: MKCoordinateSpan(latitudeDelta: 0.4, longitudeDelta: 0.4)
    )
    @Published var annotations: [AnnotationViewModel] = []
    
    func getCarList(){
        let provider = MoyaProvider<CodingTaskAPITarget>()
        provider.request(.listCars) { [unowned self] result in
            switch result {
            case let .success(response):
                do {
                    let carsJSON = try response.mapJSON()
                    guard let cars = Mapper<Car>().mapArray(JSONObject: carsJSON) else{ return }
                    let annotationVMArray = cars.map({AnnotationViewModel.init(car: $0)})
                    self.annotations = annotationVMArray
                    
                    self.region = MKCoordinateRegion(
                        center: self.calculateAnnotationArrayMidpoint(annotations: annotationVMArray),
                        span: MKCoordinateSpan(latitudeDelta: 0.4, longitudeDelta: 0.4)
                    )
                }
                catch{
                    print("err")
                }
            case let .failure(error):
                print(error.localizedDescription)
                break
            }
            
        }
        
    }
    
}

extension MapViewModel{
    
    func calculateAnnotationArrayMidpoint(annotations: [AnnotationViewModel]) -> CLLocationCoordinate2D{
        let latitudeSumArray = annotations.reduce(0, {$0 + $1.coordinate.latitude})
        let latitudeMidpoint = latitudeSumArray / Double(annotations.count)
        let longitudeSumArray = annotations.reduce(0, {$0 + $1.coordinate.longitude})
        let longitudeMidpoint = longitudeSumArray / Double(annotations.count)
        return CLLocationCoordinate2D.init(latitude: latitudeMidpoint, longitude: longitudeMidpoint)
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

