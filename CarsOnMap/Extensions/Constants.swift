//
//  Constants.swift
//  CarsOnMap
//
//  Created by Ozan YALDIR on 29.11.2021.
//

import Foundation


struct Constants{
    static var mockResponse: String? {
        if let path = Bundle.main.path(forResource: "list_cars", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let str = String(decoding: data, as: UTF8.self)
                return str
            } catch {
                return nil
            }
        }
        return nil
    }
}
