//
//  CarListPageObject.swift
//  CarsOnMap
//
//  Created by Ozan Yaldır on 10.12.2021.
//

import Foundation
import XCTest

class CarListPageObject{
    
    var app: XCUIApplication
    
    init(app: XCUIApplication){
        self.app = app
    }
    
    var tabBar: XCUIElement{
        app.tabBars["Tab Bar"]
    }
    
    var carNameText: XCUIElement{
        app.staticTexts["carNameText"]
    }
    
}
