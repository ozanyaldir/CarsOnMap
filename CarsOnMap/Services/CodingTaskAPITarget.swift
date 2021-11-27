//
//  APITarget.swift
//  CarsOnMap
//
//  Created by Ozan YALDIR on 27.11.2021.
//

import Foundation
import Moya

enum CodingTaskAPITarget {
    case listCars
}

extension CodingTaskAPITarget: TargetType, AccessTokenAuthorizable {
    
    var parameters: [String : Any]? {
        [:]
    }
    
    var baseURL: URL {
        let url = "https://cdn.sixt.io/codingtask/"
        return URL.init(string: url)!
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
        case .listCars: return .get
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .listCars: return URLEncoding.default
        }
    }
    
    var task: Task {
        .requestParameters(parameters: parameters ?? [:], encoding: parameterEncoding)
    }
    
    var shouldAuthorize: Bool {
        false
    }
    
    var authorizationType: AuthorizationType? {
        .bearer
    }
    
    var sampleData: Data {
        Data()
    }
}

