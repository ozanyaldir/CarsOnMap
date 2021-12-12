//
//  CarDecodable.swift
//  CarsOnMap
//
//  Created by Ozan Yaldır on 12.12.2021.
//

import Foundation

struct CarDTO: Decodable {
    var id: String
    var latitude: Double
    var longitude: Double
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
}
