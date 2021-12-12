//
//  CarListPageObject.swift
//  CarsOnMap
//
//  Created by Ozan Yaldır on 10.12.2021.
//

import Foundation
import XCTest

class CarListPageObject: MainViewPageObject{
    
    var carList: XCUIElement{
        app.tables["carList"]
    }
    
}
