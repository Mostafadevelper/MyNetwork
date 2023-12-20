//
//  BaseResponse.swift
//  MyNetwork
//
//  Created by Mostafa on 16/12/2023.
//

import Foundation


class BaseResponse<T: Decodable>: Decodable {
    
    var status: String?
    var data: T?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case data = "data"
    }
}
