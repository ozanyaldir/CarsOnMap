//
//  RequestResourceFactory.swift
//  CarsOnMap
//
//  Created by Ozan Yaldır on 10.12.2021.
//

import Foundation


class RequestResourceFactory{
    
    static func createCarRequestResource() -> CarsRequestResourceProtocol{
        let requestResource = CarsRequestResource.init(provider: MoyaProviderFactory.create())
        let environment = ProcessInfo.processInfo.environment["ENV"]
        if let environment = environment, environment == "TEST"{
            return MockCarRequestResource.init(requestResource: requestResource)
        }
        return requestResource
    }
}
