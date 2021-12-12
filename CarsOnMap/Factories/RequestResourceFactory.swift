//
//  RequestResourceFactory.swift
//  CarsOnMap
//
//  Created by Ozan Yaldır on 10.12.2021.
//

import Foundation
import Moya

class RequestResourceFactory{
    
    static func createCarRequestResource(provider: MoyaProvider<CarsOnMapAPITarget> = MoyaProviderFactory.create()) -> CarsRequestResourceProtocol{
        let requestResource = CarsRequestResource.init(provider: provider)
        let environment = ProcessInfo.processInfo.environment["ENV"]
        if let environment = environment, environment == "TEST"{
            return MockCarRequestResource.init(requestResource: requestResource)
        }
        return requestResource
    }
}
