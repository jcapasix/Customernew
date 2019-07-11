//
//  LoginPresenter.swift
//  Customernew
//
//  Created by Jordan Capa on 7/10/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation
import FBSDKLoginKit

class LoginPresenter{
    
    fileprivate weak var view: LoginViewProtocol?
    internal let router: LoginRouterProtocol
    internal let interactor: LoginInteractorProtocol
    
    init(view:LoginViewProtocol, router: LoginRouterProtocol, interactor: LoginInteractorProtocol) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
}

extension LoginPresenter: LoginPresenterProtocol{
    
    func socialLogin() {
        self.interactor.socialLogin(view: self.view!)
    }
    
    func successSocialLogin(){
        AuthManager.sharedInstance.login(value: true)
        self.goToHome()
    }
    
    func successSocialLogin(loginResult: LoginManagerLoginResult){
        AuthManager.sharedInstance.login(value: true)
        self.goToHome()
    }
    
    func goToHome(){
        self.router.routeToHome()
    }
    
}

