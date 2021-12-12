//
//  CarDetailPageObject.swift
//  CarsOnMap
//
//  Created by Ozan Yaldır on 11.12.2021.
//

import Foundation
import XCTest

class CarDetailPageObject: MainViewPageObject{
    
    var nameText: XCUIElement{
        app.staticTexts["nameText"]
    }
    var modelNameText: XCUIElement{
        app.staticTexts["modelNameText"]
    }
    var licensePlateText: XCUIElement{
        app.staticTexts["licensePlateText"]
    }
    var colorText: XCUIElement{
        app.staticTexts["colorText"]
    }
    var innerCleanliness: XCUIElement{
        app.staticTexts["innerCleanlinessText"]
    }
    var fuelLevelText: XCUIElement{
        app.staticTexts["fuelLevelText"]
    }
    var fuelTypeText: XCUIElement{
        app.staticTexts["fuelTypeText"]
    }
    var seriesText: XCUIElement{
        app.staticTexts["seriesText"]
    }
    var groupText: XCUIElement{
        app.staticTexts["groupText"]
    }
    var makeText: XCUIElement{
        app.staticTexts["makeText"]
    }
    var transmissionText: XCUIElement{
        app.staticTexts["transmissionText"]
    }
    var modelIdentifierText: XCUIElement{
        app.staticTexts["modelIdentifierText"]
    }
    
}

