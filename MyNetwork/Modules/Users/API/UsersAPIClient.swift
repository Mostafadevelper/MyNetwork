//
//  UsersAPI.swift
//  MyNetwork
//
//  Created by Mostafa on 16/12/2023.
//

// public enum Result<Value> {
// @frozen public enum Result<Success, Failure> where Failure : Error {

import Foundation
import Alamofire

typealias UserCompletion = (Result<BaseResponse<[UserModelResponse]>?>) -> Void

protocol UserAPIProtocol: AnyObject {
    func getUsers(completion: @escaping UserCompletion)
}

class UsersAPIClient: BaseAPIClient<UsersAPIRouter>, UserAPIProtocol {
    
    func getUsers(completion: @escaping (Result<BaseResponse<[UserModelResponse]>?>) -> Void) {
        performRequest(
            target: .getUsers,
            response: BaseResponse<[UserModelResponse]>.self,
            completionHandler: completion
        )
    }
    
}
