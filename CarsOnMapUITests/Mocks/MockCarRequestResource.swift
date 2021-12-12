//
//  MockCarRequestResource.swift
//  CarsOnMapUITests
//
//  Created by Ozan Yaldır on 10.12.2021.
//

import Foundation
@testable import Moya

class MockCarRequestResource: CarsRequestResourceProtocol{
    
    let requestResource: CarsRequestResource
    
    init(){
        let provider = MoyaProvider<CarsOnMapAPITarget>(stubClosure: MoyaProvider.immediatelyStub)
        let requestResource = CarsRequestResource.init(provider: provider)
        self.requestResource = requestResource
    }
    
    func getCarsList(_ completion: @escaping (Result<[Car], APICallError>) -> Void) {
        requestResource.getCarsList { result in
            completion(result)
        }
    }
}
