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
        center: CLLocationCoordinate2D(latitude: 48.137154, longitude: 11.576124),
        span: MKCoordinateSpan(latitudeDelta: 0.4, longitudeDelta: 0.4)
    )
    
    @Published var annotations: [AnnotationViewModel] = []
    
    func getCarList(){
        let provider = MoyaProvider<CodingTaskAPITarget>()
        provider.request(.listCars) { result in
            switch result {
            case let .success(response):
                do {
                    let carsJSON = try response.mapJSON()
                    guard let cars = Mapper<Car>().mapArray(JSONObject: carsJSON) else{ return }
                    self.annotations = cars.map({AnnotationViewModel.init(car: $0)})
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

