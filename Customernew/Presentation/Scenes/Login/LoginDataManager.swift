//
//  LoginDataManager.swift
//  Customernew
//
//  Created by Jordan Capa on 7/11/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation
import FirebaseAuth
import Firebase
import FBSDKLoginKit

class LoginDataManager: LoginDataManagerProtocol {
    
    internal var interactor: LoginInteractorProtocol!
    
    func socialLogin(view: LoginViewProtocol) {
        
        let loginManager = LoginManager()
        loginManager.logIn(permissions: ["public_profile", "email"], from: view as! LoginViewController) { (loginResult, error) in
            
            if error == nil{
                self.interactor.successSocialLogin(loginResult: loginResult!)
            }
        }

    }
}
