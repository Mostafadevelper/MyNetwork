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
        
        let api: UserAPIProtocol = UsersAPIClient()
        api.getUsers { (result) in
            switch result {
            case .success(let response):
                let users = response?.data
                for user in users ?? [] {
                    print("\(user.name ?? "") => \(user.salary ?? 0.0)")
                }
            case .failure(let error):
                print("")
                print(error.localizedDescription)
            }
        }
    }
}
