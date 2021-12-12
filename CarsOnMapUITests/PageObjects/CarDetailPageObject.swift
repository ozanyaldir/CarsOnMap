//
//  CarDetailPageObject.swift
//  CarsOnMap
//
//  Created by Ozan Yaldır on 11.12.2021.
//

import Foundation
import XCTest

class CarDetailPageObject{
    
    var app: XCUIApplication
    
    init(app: XCUIApplication){
        self.app = app
    }
    
    var carNameText: XCUIElement{
        app.staticTexts["carNameText"]
    }
    var carModelNameText: XCUIElement{
        app.staticTexts["carModelNameText"]
    }
    
}

