//
//  Car.swift
//  CarsOnMap
//
//  Created by Ozan Yaldır on 12.12.2021.
//

import Foundation
import MapKit

class Car {
    let id: String
    let latitude: Double
    let longitude: Double
    let carImageUrl: String?
    let color: String?
    let fuelLevel: Double?
    let fuelType: String?
    let group: String?
    let innerCleanliness: String?
    let licensePlate: String?
    let make: String?
    let modelIdentifier: String?
    let modelName: String?
    let name: String?
    let series: String?
    let transmission: String?
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: self.latitude, longitude: self.longitude)
    }
    
    init(dto: CarDTO){
        
        self.id = dto.id
        self.latitude = dto.latitude
        self.longitude = dto.longitude
        self.carImageUrl = dto.carImageUrl
        self.color = dto.color
        self.fuelLevel = dto.fuelLevel
        self.fuelType = dto.fuelType
        self.group = dto.group
        self.innerCleanliness = dto.innerCleanliness
        self.licensePlate = dto.licensePlate
        self.make = dto.make
        self.modelIdentifier = dto.modelIdentifier
        self.modelName = dto.modelName
        self.name = dto.name
        self.series = dto.series
        self.transmission = dto.transmission
        
    }
}
