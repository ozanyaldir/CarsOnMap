//
//  Car.swift
//  CarsOnMap
//
//  Created by Ozan YALDIR on 27.11.2021.
//

import Foundation
import ObjectMapper

struct Car: Mappable {
    var id: String?
    var latitude: Double?
    var longitude: Double?
    var carImageUrl: String?
    var color: String?
    var fuelLevel: Double?
    var fuelType: String?
    var group: String?
    var innerCleanliness: String?
    var licensePlate: String?
    var make: String?
    var modelIdentifier: String?
    var modelName: String?
    var name: String?
    var series: String?
    var transmission: String?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        id                <- map["id"]
        latitude          <- map["latitude"]
        longitude         <- map["longitude"]
        carImageUrl       <- map["carImageUrl"]
        color             <- map["color"]
        fuelLevel         <- map["fuelLevel"]
        fuelType          <- map["fuelType"]
        group             <- map["group"]
        innerCleanliness  <- map["innerCleanliness"]
        licensePlate      <- map["licensePlate"]
        make              <- map["make"]
        modelIdentifier   <- map["modelIdentifier"]
        modelName         <- map["modelName"]
        name              <- map["name"]
        series            <- map["series"]
        transmission      <- map["transmission"]
    }
}
