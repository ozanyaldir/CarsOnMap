//
//  CarMapPageObject.swift
//  CarsOnMapUITests
//
//  Created by Ozan Yaldır on 12.12.2021.
//

import Foundation
import XCTest

class CarMapPageObject: MainViewPageObject{
    
    var carMap: XCUIElement{
        app.maps.firstMatch
    }
    
    
}

