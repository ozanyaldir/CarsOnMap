//
//  CarList.swift
//  CarsOnMap
//
//  Created by Ozan YALDIR on 28.11.2021.
//

import Foundation
import Moya
import MapKit
import ObjectMapper

class CarListViewModel: ObservableObject {
    @Published var cars: [CarListItemViewModel] = []
    
    func getCarList(){
        let provider = MoyaProvider<CodingTaskAPITarget>()
        provider.request(.listCars) { result in
            switch result {
            case let .success(response):
                do {
                    let carsJSON = try response.mapJSON()
                    guard let cars = Mapper<Car>().mapArray(JSONObject: carsJSON) else{ return }
                    self.cars = cars.map({CarListItemViewModel.init(car: $0)})
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

struct CarListItemViewModel: Identifiable{
    
    let id: String
    let name: String?
    let modelName: String
    let carImageUrl: String?
    let coordinate: CLLocationCoordinate2D
    
    let color: String?
    let fuelLevel: Double?
    let fuelType: String?
    let group: String?
    let innerCleanliness: String?
    let licensePlate: String?
    let make: String?
    let modelIdentifier: String?
    let series: String?
    let transmission: String?
    
    init(car: Car){
        self.id = car.id ?? UUID().uuidString
        self.modelName = car.modelName ?? "Undefined"
        self.name = car.name ?? "Undefined"
        self.carImageUrl = car.carImageUrl
        self.coordinate = CLLocationCoordinate2D(latitude: car.latitude!, longitude: car.longitude!)
        
        self.color = car.color
        self.fuelLevel = car.fuelLevel
        self.fuelType = car.fuelType
        self.group = car.group
        self.innerCleanliness = car.innerCleanliness
        self.licensePlate = car.licensePlate
        self.make = car.make
        self.modelIdentifier = car.modelIdentifier
        self.series = car.series
        self.transmission = car.transmission
        
    }
}

