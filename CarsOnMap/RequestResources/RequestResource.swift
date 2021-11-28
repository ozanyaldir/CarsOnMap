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
    case jsonMapping(message: String)
    case objectMapping(message: String)
    case unknown(message: String)
}

class RequestResource {
    
    open func makeBasicRequest(target: CodingTaskAPITarget, _ completion: @escaping(Result<Any, APICallError>) -> Void){
            let provider = MoyaProvider<CodingTaskAPITarget>(plugins: [CachePolicyPlugin()])
            provider.request(target) { result in
                switch result {
                case let .success(response):
                    do {
                        let responseJSON = try response.mapJSON()
                        completion(.success(responseJSON))
                    }
                    catch MoyaError.statusCode(let statusResponse) {
                        completion(.failure(.failureResponse(statusCode: statusResponse.statusCode, message: statusResponse.description)))
                    }
                    catch MoyaError.jsonMapping(_) {
                        completion(.failure(.jsonMapping(message: "Response mapping failed")))
                    }
                    catch{
                        completion(.failure(.unknown(message: "Unknown error occured")))
                    }
                case let .failure(error):
                    completion(.failure(.unknown(message: error.localizedDescription)))
                }
                
            }
    }
    
}
