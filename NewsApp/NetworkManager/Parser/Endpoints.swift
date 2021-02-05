//
//  Endpoints.swift
//  Dictionary
//
//  Created by Admin on 12/18/20.
//

import Foundation

enum Endpoints: EndpointType {
    
    case postMethod(url: String, parameters: Parameters)
    case getMethod(url: String, parameters:Parameters)
    
    var baseUrl: URL {
        return URL(string: "https://newsapi.org/v2/")!
    }
    
    var path: String {
        switch self {
        case .postMethod(let url, _):
            return url
        case .getMethod(let url, _):
            return url
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .postMethod(_, _):
            return .post
        default:
            return .get
        }
    }
    
    var task: HTTPTask {
        
        var headers: HTTPHeaders? = [:]
       
        switch self {
        case .postMethod(_, let parameters):
            return .requestParametersAndHeaders(bodyParameters: parameters, urlParameters: nil, additionalHeaders: headers)
        case .getMethod(_, let parameters):
            return .requestParametersAndHeaders(bodyParameters: nil, urlParameters: parameters, additionalHeaders: headers)
        }
    }
}
