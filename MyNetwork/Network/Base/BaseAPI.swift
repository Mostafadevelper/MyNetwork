//
//  BaseAPI.swift
//  MyNetwork
//
//  Created by Mostafa on 15/12/2023.
//

import Foundation
import Alamofire


class BaseAPI<T: TargetType> {
    
    func fetchData<M: Decodable>(
        target: T,
        response: M.Type,
        completionHandler: @escaping (Result<M?>) -> Void
    ) {
        let method = Alamofire.HTTPMethod(rawValue: target.method.rawValue)
        let headers = target.headers ?? [:]
        let paramters = buildParams(task: target.task)
        
        Alamofire.request(
            target.baseUrl + target.path,
            method: method! ,
            parameters: paramters.0,
            encoding: paramters.1,
            headers: headers).responseJSON { response in
                guard let statusCode = response.response?.statusCode else {
                    completionHandler(.failure(NSError()))
                    return
                }
                if statusCode == 200 {
                    guard let json = try? JSONDecoder().decode(M.self, from: response.data ?? Data()) else {
                        completionHandler(.failure(NSError()))
                        return
                    }
                    completionHandler(.success(json))
                }else {
                    completionHandler(.failure(NSError()))
                }
            }
        
    }
   
    private func buildParams(task: Task) -> ([String:Any], ParameterEncoding) {
        switch task {
        case .requestPlain:
            return ([:], URLEncoding.default)
        case .requestParamters(let paramter, let encoding):
            return (paramter,encoding)
        }
    }
}
