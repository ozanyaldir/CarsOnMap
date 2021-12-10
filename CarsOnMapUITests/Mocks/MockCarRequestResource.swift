//
//  MockCarRequestResource.swift
//  CarsOnMapUITests
//
//  Created by Ozan Yaldır on 10.12.2021.
//

import Foundation

class MockCarRequestResource: CarsRequestResourceProtocol{
    
    let requestResource: CarsRequestResource
    
    init(requestResource: CarsRequestResource){
        self.requestResource = requestResource
    }
    init(){
        let requestResource = CarsRequestResource.init(provider: MoyaProviderFactory.create())
        self.requestResource = requestResource
    }
    
    func getCarsList(_ completion: @escaping (Result<[Car], APICallError>) -> Void) {
        requestResource.getCarsList { result in
            completion(result)
        }
    }
}
