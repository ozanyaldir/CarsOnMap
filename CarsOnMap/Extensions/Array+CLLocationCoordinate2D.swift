//
//  Array+AnnotationViewModel.swift
//  CarsOnMap
//
//  Created by Ozan YALDIR on 28.11.2021.
//

import Foundation
import MapKit

extension Array where Element == CLLocationCoordinate2D {
    func calculateCoordinatesArrayMidpoint() -> CLLocationCoordinate2D{
        let latitudeSumArray = self.reduce(0, {$0 + $1.latitude})
        let latitudeMidpoint = latitudeSumArray / Double(self.count)
        let longitudeSumArray = self.reduce(0, {$0 + $1.longitude})
        let longitudeMidpoint = longitudeSumArray / Double(self.count)
        return CLLocationCoordinate2D.init(latitude: latitudeMidpoint, longitude: longitudeMidpoint)
    }
}
