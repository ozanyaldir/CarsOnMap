//
//  RequestResource.swift
//  CarsOnMap
//
//  Created by Ozan YALDIR on 28.11.2021.
//

import Foundation
import Moya

enum APICallError: Error{
    case failureResponse(statusCode: Int, message: String)
    case responseMapping(message: String = Constants.Messages.responseMappingFailure)
    case unknown(message: String = Constants.Messages.unknownError)
}

class RequestResource {
    
    let provider: MoyaProvider<CarsOnMapAPITarget>
    
    init(provider: MoyaProvider<CarsOnMapAPITarget>){
        self.provider = provider
    }
    
    open func makeBasicRequest(target: CarsOnMapAPITarget, _ completion: @escaping(Result<Data, APICallError>) -> Void){
        provider.request(target) { result in
            switch result {
            case let .success(response):
                do {
                    let filteredResponse = try response.filterSuccessfulStatusCodes()
                    let responseData = filteredResponse.data
                    completion(.success(responseData))
                }
                catch MoyaError.statusCode(let statusResponse) {
                    completion(.failure(.failureResponse(statusCode: statusResponse.statusCode, message: statusResponse.description)))
                }
                catch let error{
                    completion(.failure(.unknown(message: error.localizedDescription)))
                }
            case let .failure(error):
                completion(.failure(.unknown(message: error.localizedDescription)))
            }
            
        }
    }
    
}
