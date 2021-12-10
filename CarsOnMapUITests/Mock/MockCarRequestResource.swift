//
//  MockCarRequestResource.swift
//  CarsOnMapUITests
//
//  Created by Ozan Yaldır on 10.12.2021.
//

import Foundation
@testable import Moya
//@testable import CodingTaskAPITarge

class MockCarRequestResource: CarsRequestResourceProtocol{
    func getCarsList(_ completion: @escaping (Result<[Car], APICallError>) -> Void) {
        let requestResource = CarsRequestResource.init(provider: MoyaProvider<CodingTaskAPITarget>(stubClosure: MoyaProvider.immediatelyStub))
        requestResource.getCarsList { result in
            completion(result)
        }
    }
    
    
}
