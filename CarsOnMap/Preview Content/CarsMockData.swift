//
//  CarsMockData.swift
//  CarsOnMap
//
//  Created by Ozan YALDIR on 27.11.2021.
//

import Foundation

class CarsMockData {
    
    static func loadCarsData() -> Data {
        // read the json file
        guard let path = Bundle.main.path(forResource: "cars", ofType: "json") else {
            fatalError("Path for cars.json was not found")
        }
        
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else {
            fatalError("Unable to load data!")
        }
        
        return data
    }
    
    static func loadCarsDTOs() -> [CarDTO] {
        guard let carsDTO = try? JSONDecoder().decode([CarDTO].self, from: loadCarsData()) else {
            fatalError("Unable to decode data!")
        }
        
        return carsDTO
    }
    
    
    static func loadCars() -> [Car] {
        
        let carsDTOs = loadCarsDTOs()
        return carsDTOs.map(Car.init)
    }
    
}
