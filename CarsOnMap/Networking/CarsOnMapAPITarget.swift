//
//  APITarget.swift
//  CarsOnMap
//
//  Created by Ozan YALDIR on 27.11.2021.
//

import Foundation
import Moya

enum CarsOnMapAPITarget {
    case listCars
}

extension CarsOnMapAPITarget: TargetType {
    
    var parameters: [String : Any]? {
        [:]
    }
    
    var baseURL: URL {
        return Constants.baseURL
    }
    
    var path: String {
        switch self {
        case .listCars: return "cars"
        }
    }
    
    var headers: [String : String]? {
        [:]
    }
    
    var method: Moya.Method {
        switch self {
        case .listCars:
            return .get
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .listCars:
            return URLEncoding.default
        }
    }
    
    var task: Task {
        .requestParameters(parameters: parameters ?? [:], encoding: parameterEncoding)
    }
    
    var sampleData: Data{
        var JSONString = ""
        switch self {
        case .listCars:
            JSONString = "[{\"id\":\"WBY1Z41030VU98776\",\"fuelType\":\"E\",\"modelIdentifier\":\"bmw_i3\",\"transmission\":\"A\",\"series\":\"i3\",\"modelName\":\"BMW i3\",\"longitude\":11.574494,\"latitude\":48.189471,\"color\":\"absolute_black_metal\",\"carImageUrl\":\"https://cdn.sixt.io/codingtask/images/bmw_i3.png\",\"group\":\"BMW\",\"licensePlate\":\"M-NC1027\",\"make\":\"BMW\",\"fuelLevel\":0.62,\"innerCleanliness\":\"VERY_CLEAN\",\"name\":\"Casimir\"},{\"id\":\"WMWZF31040TX87911\",\"fuelType\":\"P\",\"modelIdentifier\":\"mini\",\"transmission\":\"M\",\"series\":\"MINI\",\"modelName\":\"MINI\",\"longitude\":11.556484,\"latitude\":48.125121,\"color\":\"midnight_black\",\"carImageUrl\":\"https://cdn.sixt.io/codingtask/images/mini.png\",\"group\":\"MINI\",\"licensePlate\":\"M-VO0310\",\"make\":\"BMW\",\"fuelLevel\":0.8,\"innerCleanliness\":\"REGULAR\",\"name\":\"Quentin\"},{\"id\":\"WMWSW31060T114071?\",\"fuelType\":\"D\",\"modelIdentifier\":\"mini\",\"transmission\":\"M\",\"series\":\"MINI\",\"modelName\":\"MINI\",\"longitude\":11.563875,\"latitude\":48.193826,\"color\":\"schwarz\",\"carImageUrl\":\"https://cdn.sixt.io/codingtask/images/mini.png\",\"group\":\"MINI\",\"licensePlate\":\"M-IL1296?\",\"make\":\"BMW\",\"fuelLevel\":0.98,\"innerCleanliness\":\"VERY_CLEAN\",\"name\":\"Vicki+\"}]"
            
        }
        return Data(JSONString.utf8)
    }
    
}

extension CarsOnMapAPITarget: CachePolicyGettable {
    var cachePolicy: URLRequest.CachePolicy {
        switch self {
        case .listCars:
            return .useProtocolCachePolicy
            //default:
            //    return .reloadIgnoringLocalCacheData
        }
    }
}
