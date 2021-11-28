//
//  CarsOnMapTests.swift
//  CarsOnMapTests
//
//  Created by Ozan YALDIR on 27.11.2021.
//

import XCTest
import MapKit
@testable import CarsOnMap

class when_loading_the_map_view: XCTestCase {
    
    func test_should_calculate_cars_midpoint_successfully() throws {
        let coordinate1 = CLLocationCoordinate2D(latitude: 10, longitude: 20)
        let coordinate2 = CLLocationCoordinate2D(latitude: 20, longitude: 40)
        let midpoint = [coordinate1, coordinate2].calculateCoordinatesArrayMidpoint()
        XCTAssertEqual(midpoint.latitude, 15)
        XCTAssertEqual(midpoint.longitude, 30)
    }

}
