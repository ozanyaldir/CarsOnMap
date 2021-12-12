//
//  MainViewPageObject.swift
//  CarsOnMapUITests
//
//  Created by Ozan Yaldır on 12.12.2021.
//

import Foundation
import XCTest

class MainViewPageObject{
    
    var app: XCUIApplication
    
    init(app: XCUIApplication){
        self.app = app
    }
    
    var tabBar: XCUIElement{
        app.tabBars["Tab Bar"]
    }
    
}
