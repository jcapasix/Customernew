//
//  LoginInteractor.swift
//  Customernew
//
//  Created by Jordan Capa on 7/11/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation
import FBSDKLoginKit
import FirebaseAuth
import SVProgressHUD

class LoginInteractor: LoginInteractorProtocol {
    
    var presenter: LoginPresenterProtocol!
    var dataManager: LoginDataManagerProtocol!
    
    func socialLogin(view: LoginViewProtocol) {
        self.dataManager.socialLogin(view: view)
    }
    
    func successSocialLogin(loginResult: LoginManagerLoginResult) {
        self.presenter.successSocialLogin(loginResult: loginResult)
    }
}
