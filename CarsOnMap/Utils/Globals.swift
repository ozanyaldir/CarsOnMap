//
//  Globals.swift
//  CarsOnMap
//
//  Created by Ozan Yaldır on 12.12.2021.
//

import Foundation

struct Globals{
    static var isTest: Bool {
        if let environment = ProcessInfo.processInfo.environment["ENV"], environment == "TEST"{
            return true
        }
        return false
    }
}
