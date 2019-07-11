//
//  LoginRouter.swift
//  Customernew
//
//  Created by Jordan Capa on 7/10/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation

class LoginRouter: LoginRouterProtocol {
    
    fileprivate weak var view: LoginViewController?

    init(view: LoginViewController) {
        self.view = view
    }
    
    func routeToHome(){
        let homeController = HomeViewController()
        view?.navigationController?.pushViewController(homeController, animated: true)
    }
}
