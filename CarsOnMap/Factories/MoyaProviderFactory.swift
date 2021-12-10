//
//  MoyaProviderFactory.swift
//  CarsOnMap
//
//  Created by Ozan Yaldır on 10.12.2021.
//

import Foundation
import Moya

class MoyaProviderFactory{
    static func create() -> MoyaProvider<CarsOnMapAPITarget>{
        let environment = ProcessInfo.processInfo.environment["ENV"]
        if let environment = environment, environment == "TEST"{
            return MoyaProvider<CarsOnMapAPITarget>(stubClosure: MoyaProvider.immediatelyStub)
        }
        return MoyaProvider<CarsOnMapAPITarget>(plugins: [CachePolicyPlugin()])
    }
}
