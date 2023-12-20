//
//  ViewController.swift
//  MyNetwork
//
//  Created by Mostafa on 15/12/2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let api = UsersAPI()
        api.getUsers { response, error in
            
        }
    }

}

/*
 
 let api: UsersAPIProtocol = UsersAPI()
 api.getUsers { (result) in
     switch result {
     case .success(let response):
         let users = response?.data
         for user in users ?? [] {
             print("\(user.name ?? "") => \(user.salary ?? "")")
         }
     case .failure(let error):
         print(error.userInfo[NSLocalizedDescriptionKey] as? String ?? "")
     }

 
 **/
