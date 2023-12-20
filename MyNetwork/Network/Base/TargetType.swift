//
//  TargetType.swift
//  MyNetwork
//
//  Created by Mostafa on 15/12/2023.
//

import Foundation
import Alamofire

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum Task {
    case requestPlain
    case requestParamters(paramter: [String:Any], encoding: ParameterEncoding)
}

protocol TargetType {
    
    var baseUrl: String { get }
    
    var path: String { get }
    
    var method: HTTPMethod { get }
    
    var task: Task { get }
    
    var headers: [String:String]? { get }
}
