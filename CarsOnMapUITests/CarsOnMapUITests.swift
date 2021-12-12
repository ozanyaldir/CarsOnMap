//
//  CarsOnMapUITests.swift
//  CarsOnMapUITests
//
//  Created by Ozan YALDIR on 27.11.2021.
//

import XCTest

class when_app_is_launched: XCTestCase {
    var app: XCUIApplication!
    var requestResource: MockCarRequestResource!
    var carMapPageObject: CarMapPageObject!
    var carListPageObject: CarListPageObject!
    var carDetailPageObject: CarDetailPageObject!
    
    override func setUp() {
        app = XCUIApplication()
        carListPageObject = CarListPageObject(app: app)
        carMapPageObject = CarMapPageObject(app: app)
        carDetailPageObject = CarDetailPageObject(app: app)
        requestResource = MockCarRequestResource()
        continueAfterFailure = false
        app.launchEnvironment = ["ENV": "TEST"]
        app.launch()
        
    }
    
    func test_should_display_car_map(){
        carMapPageObject.tabBar.buttons.element(boundBy: 0).tap()
        let _ = carMapPageObject.carMap.waitForExistence(timeout: 2.0)
        XCTAssertTrue(carMapPageObject.carMap.exists)
        
    }
    
    func test_should_display_car_list(){
        carMapPageObject.tabBar.buttons.element(boundBy: 1).tap()
        let _ = carListPageObject.carList.waitForExistence(timeout: 2.0)
        XCTAssertEqual(carListPageObject.carList.cells.count, 3)
        
    }
    
    func test_should_display_car_detail(){
        carMapPageObject.tabBar.buttons.element(boundBy: 1).tap()
        let _ = carListPageObject.carList.waitForExistence(timeout: 2.0)
        carListPageObject.carList.cells.element(boundBy: 0).tap()
        let _ = carDetailPageObject.carNameText.waitForExistence(timeout: 2.0)
        XCTAssertTrue(carDetailPageObject.carNameText.exists)
        
    }
}
