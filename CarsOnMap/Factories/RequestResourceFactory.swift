//
//  RequestResourceFactory.swift
//  CarsOnMap
//
//  Created by Ozan Yaldır on 10.12.2021.
//

import Foundation
import Moya

class RequestResourceFactory{
    
    static func createCarRequestResource(provider: MoyaProvider<CarsOnMapAPITarget> = .init(plugins: [CachePolicyPlugin()])) -> CarsRequestResourceProtocol{
        switch Globals.isTest{
        case true:
            return MockCarRequestResource()
        case false:
            return CarsRequestResource.init(provider: provider)
        }
    }
}
