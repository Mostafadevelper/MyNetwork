//
//  UserModel.swift
//  MyNetwork
//
//  Created by Mostafa on 16/12/2023.
//

import Foundation

class UserModel: Codable {
    
    var name: String?
    var salary: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "employee_name"
        case salary = "employee_salary"
    }
}
