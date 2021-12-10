//
//  CarsOnMapUITests.swift
//  CarsOnMapUITests
//
//  Created by Ozan YALDIR on 27.11.2021.
//

import XCTest

class when_main_view_is_shown: XCTestCase {
    var app: XCUIApplication!
    var requestResource: MockCarRequestResource!
    
    override func setUp() {
        app = XCUIApplication()
        requestResource = MockCarRequestResource()
        continueAfterFailure = false
        app.launch()
    }

    func test_should_run(){
        requestResource.getCarsList { result in
            switch result{
            case .success(let cars):
                print(cars)
                XCTAssertNotNil(cars)
            case .failure(_):
                XCTFail()
            }
        }
    }
}
