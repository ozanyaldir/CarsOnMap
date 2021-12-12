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
    private let requestResource: CarsRequestResourceProtocol = RequestResourceFactory.createCarRequestResource()
    @Published private(set) var cars: [CarListItemViewModel] = []
    private(set) var apiCallError: APICallError?
    @Published var isFailed: Bool = false
    
    func getCarList(){
        isFailed = false
        requestResource.getCarsList { [unowned self] result in
            switch result{
            case .success(let cars):
                DispatchQueue.main.async {
                    self.cars = cars.map(CarListItemViewModel.init)
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
    var color: String?{
        car.color
    }
    var fuelLevel: Double?{
        car.fuelLevel
    }
    var fuelType: String?{
        car.fuelType
    }
    var group: String?{
        car.group
    }
    var innerCleanliness: String?{
        car.innerCleanliness
    }
    var licensePlate: String?{
        car.licensePlate
    }
    var make: String?{
        car.make
    }
    var modelIdentifier: String?{
        car.modelIdentifier
    }
    var series: String?{
        car.series
    }
    var transmission: String?{
        car.transmission
    }
}

