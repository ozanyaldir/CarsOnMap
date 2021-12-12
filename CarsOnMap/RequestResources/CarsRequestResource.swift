//
//  CarsRequestResource.swift
//  CarsOnMap
//
//  Created by Ozan YALDIR on 28.11.2021.
//

import Foundation
import Moya

protocol CarsRequestResourceProtocol{
    func getCarsList(_ completion: @escaping(Result<[Car], APICallError>) -> Void)
}

class CarsRequestResource: RequestResource, CarsRequestResourceProtocol {
    
    func getCarsList(_ completion: @escaping(Result<[Car], APICallError>) -> Void){
        makeBasicRequest(target: .listCars) { result in
            switch result{
            case .success(let responseData):
                do{
                    let carDTOs = try JSONDecoder().decode([CarDTO].self, from: responseData)
                    let cars = carDTOs.map(Car.init)
                    return completion(.success(cars))
                }
                catch {
                    return completion(.failure(.responseMapping()))
                }
            case .failure(let error):
                return completion(.failure(error))
            }
        }
    }
}
