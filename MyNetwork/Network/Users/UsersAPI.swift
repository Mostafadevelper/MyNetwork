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

protocol UserAPIProtocol {
    func getUsers(completion: @escaping (Result<BaseResponse<[UserModel]>?>) -> Void)
}

class UsersAPI: BaseAPI<UsersNetworking>, UserAPIProtocol {
    func getUsers(completion: @escaping (Alamofire.Result<BaseResponse<[UserModel]>?>) -> Void) {
        fetchData(target: .getUsers,
                  response: BaseResponse<[UserModel]>.self,
                  completionHandler: completion)
    }
    
}
