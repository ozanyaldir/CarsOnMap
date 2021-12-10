//
//  CarsRequestResource.swift
//  CarsOnMap
//
//  Created by Ozan YALDIR on 28.11.2021.
//

import Foundation
import Moya
import ObjectMapper

protocol CarsRequestResourceProtocol{
    func getCarsList(_ completion: @escaping(Result<[Car], APICallError>) -> Void)
}

class CarsRequestResource: RequestResource, CarsRequestResourceProtocol {
    
    func getCarsList(_ completion: @escaping(Result<[Car], APICallError>) -> Void){
        makeBasicRequest(target: .listCars) { result in
            switch result{
            case .success(let jsonObject):
                guard let cars = Mapper<Car>().mapArray(JSONObject: jsonObject) else{
                    return completion(.failure(.objectMapping(message: "Object mapping failed ")))
                }
                return completion(.success(cars))
            case .failure(let error):
                return completion(.failure(error))
            }
        }
    }
}
