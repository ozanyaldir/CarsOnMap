//
//  CarsOnMapUITests.swift
//  CarsOnMapUITests
//
//  Created by Ozan YALDIR on 27.11.2021.
//

import XCTest

class when_car_list_view_is_shown: XCTestCase {
    var app: XCUIApplication!
    var requestResource: MockCarRequestResource!
    var carListPageObject: CarListPageObject!
    
    override func setUp() {
        app = XCUIApplication()
        carListPageObject = CarListPageObject(app: app)
        requestResource = MockCarRequestResource()
        continueAfterFailure = false
        app.launchEnvironment = ["ENV": "TEST"]
        app.launch()
        
        carListPageObject.tabBar.buttons["List"].tap()
        let _ = app.waitForExistence(timeout: 500)
    }
    
    func test_should_be_able_to_view_car_details(){
        app.tables.cells.element(boundBy: 0).tap()
    }
}
