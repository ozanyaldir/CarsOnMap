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
    var pageObject: CarListPageObject!
    
    override func setUp() {
        app = XCUIApplication()
        pageObject = CarListPageObject(app: app)
        requestResource = MockCarRequestResource()
        continueAfterFailure = false
        app.launchEnvironment = ["ENV": "TEST"]
        app.launch()
        
        pageObject.tabBar.buttons["List"].tap()
        
    }
    
    func test_should_run(){
        
        app.tables.cells.element(boundBy: 0).tap()
        
    }
}
