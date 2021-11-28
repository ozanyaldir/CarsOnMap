//
//  CarList.swift
//  CarsOnMap
//
//  Created by Ozan YALDIR on 28.11.2021.
//

import Foundation
import MapKit
import Moya

class CarListViewModel: ObservableObject {
    private let requestResource = CarsRequestResource.init(provider: MoyaProvider<CodingTaskAPITarget>(plugins: [CachePolicyPlugin()]))
    @Published private(set) var cars: [CarListItemViewModel] = []
    @Published private(set) var apiCallError: APICallError?
    @Published var isFailed: Bool = false
    
    func getCarList(){
        isFailed = false
        requestResource.getCarsList { [unowned self] result in
            switch result{
            case .success(let cars):
                DispatchQueue.main.async {
                    self.cars = cars.map({CarListItemViewModel.init(car: $0)})
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

