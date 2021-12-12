//
//  CarsOnMapUITests.swift
//  CarsOnMapUITests
//
//  Created by Ozan YALDIR on 27.11.2021.
//

import XCTest

class when_app_is_launched: XCTestCase {
    var app: XCUIApplication!
    var carMapPageObject: CarMapPageObject!
    var carListPageObject: CarListPageObject!
    var carDetailPageObject: CarDetailPageObject!
    
    override func setUp() {
        app = XCUIApplication()
        carListPageObject = CarListPageObject(app: app)
        carMapPageObject = CarMapPageObject(app: app)
        carDetailPageObject = CarDetailPageObject(app: app)
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
    
}

class when_car_list_is_displayed: XCTestCase {
    var app: XCUIApplication!
    var mockRequestResource: MockCarRequestResource!
    var carListPageObject: CarListPageObject!
    var carDetailPageObject: CarDetailPageObject!
    
    override func setUp() {
        app = XCUIApplication()
        mockRequestResource = MockCarRequestResource()
        carListPageObject = CarListPageObject(app: app)
        carDetailPageObject = CarDetailPageObject(app: app)
        continueAfterFailure = false
        app.launchEnvironment = ["ENV": "TEST"]
        app.launch()
        
        
        carListPageObject.tabBar.buttons.element(boundBy: 1).tap()
        let _ = carListPageObject.carList.waitForExistence(timeout: 2.0)
        carListPageObject.carList.cells.element(boundBy: 0).tap()
        
    }
    
    func test_should_display_car_details_page(){
        let _ = carDetailPageObject.nameText.waitForExistence(timeout: 2.0)
        XCTAssertTrue(carDetailPageObject.nameText.exists)
        
    }
    
    func test_should_display_all_views_successfully(){
        let _ = carDetailPageObject.nameText.waitForExistence(timeout: 2.0)
        XCTAssertTrue(carDetailPageObject.nameText.exists)
        XCTAssertTrue(carDetailPageObject.modelNameText.exists)
        XCTAssertTrue(carDetailPageObject.modelNameText.exists)
        XCTAssertTrue(carDetailPageObject.licensePlateText.exists)
        XCTAssertTrue(carDetailPageObject.innerCleanliness.exists)
        XCTAssertTrue(carDetailPageObject.fuelLevelText.exists)
        XCTAssertTrue(carDetailPageObject.fuelTypeText.exists)
        XCTAssertTrue(carDetailPageObject.seriesText.exists)
        XCTAssertTrue(carDetailPageObject.groupText.exists)
        XCTAssertTrue(carDetailPageObject.makeText.exists)
        XCTAssertTrue(carDetailPageObject.transmissionText.exists)
        XCTAssertTrue(carDetailPageObject.modelIdentifierText.exists)
        XCTAssertTrue(carDetailPageObject.modelNameText.exists)
        XCTAssertTrue(carDetailPageObject.licensePlateText.exists)
        XCTAssertTrue(carDetailPageObject.innerCleanliness.exists)
        XCTAssertTrue(carDetailPageObject.fuelLevelText.exists)
        XCTAssertTrue(carDetailPageObject.fuelTypeText.exists)
        XCTAssertTrue(carDetailPageObject.seriesText.exists)
        XCTAssertTrue(carDetailPageObject.groupText.exists)
        XCTAssertTrue(carDetailPageObject.makeText.exists)
        XCTAssertTrue(carDetailPageObject.transmissionText.exists)
        XCTAssertTrue(carDetailPageObject.modelIdentifierText.exists)
    }
    
    //func test_should_fill_all_car_details_successfully(){
    //    let _ = carDetailPageObject.nameText.waitForExistence(timeout: 2.0)
    //    XCTAssertEqual(carDetailPageObject.nameText.label, "Casimir")
    //    XCTAssertEqual(carDetailPageObject.modelNameText.label, "BMW i3")
    //    XCTAssertEqual(carDetailPageObject.licensePlateText.label, "M-NC1027")
    //    XCTAssertEqual(carDetailPageObject.innerCleanliness.label, "VERY_CLEAN")
    //    XCTAssertEqual(carDetailPageObject.fuelLevelText.label, "%62.00")
    //    XCTAssertEqual(carDetailPageObject.fuelTypeText.label, "E")
    //    XCTAssertEqual(carDetailPageObject.seriesText.label, "i3")
    //    XCTAssertEqual(carDetailPageObject.groupText.label, "BMW")
    //    XCTAssertEqual(carDetailPageObject.makeText.label, "BMW")
    //    XCTAssertEqual(carDetailPageObject.transmissionText.label, "A")
    //    XCTAssertEqual(carDetailPageObject.modelIdentifierText.label, "bmw_i3")
    //}
    
    
    func test_should_display_all_car_details_successfully(){
        let _ = self.carDetailPageObject.nameText.waitForExistence(timeout: 2.0)
    
        mockRequestResource.getCarsList { [unowned self] result in
            switch result{
            case .success(let cars):
                guard let firstMatch = cars.first else{
                    return XCTFail()
                }
                DispatchQueue.main.async {
                    XCTAssertEqual(self.carDetailPageObject.nameText.label, firstMatch.name)
                    XCTAssertEqual(self.carDetailPageObject.modelNameText.label, firstMatch.modelName)
                    XCTAssertEqual(self.carDetailPageObject.licensePlateText.label, firstMatch.licensePlate)
                    XCTAssertEqual(self.carDetailPageObject.innerCleanliness.label, firstMatch.innerCleanliness)
                    XCTAssertEqual(self.carDetailPageObject.fuelLevelText.label, "\( firstMatch.fuelLevel != nil ? "%\(String(format: "%.2f", (firstMatch.fuelLevel! * 100)))" : "Undefined")" )
                    XCTAssertEqual(self.carDetailPageObject.fuelTypeText.label, firstMatch.fuelType)
                    XCTAssertEqual(self.carDetailPageObject.seriesText.label, firstMatch.series)
                    XCTAssertEqual(self.carDetailPageObject.groupText.label, firstMatch.group)
                    XCTAssertEqual(self.carDetailPageObject.makeText.label, firstMatch.make)
                    XCTAssertEqual(self.carDetailPageObject.transmissionText.label, firstMatch.transmission)
                    XCTAssertEqual(self.carDetailPageObject.modelIdentifierText.label, firstMatch.modelIdentifier)
                }
            case .failure(_):
                return XCTFail()
            }
        }
    }
}
