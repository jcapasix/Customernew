//
//  LoginProtocols.swift
//  Customernew
//
//  Created by Jordan Capa on 7/10/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation
import FBSDKLoginKit

protocol LoginViewProtocol: class {
    var presenter: LoginPresenterProtocol! { get set }
}

protocol LoginPresenterProtocol: class {
    var router: LoginRouterProtocol { get }
    var interactor: LoginInteractorProtocol { get }
    
    func socialLogin()
    func successSocialLogin()
    func successSocialLogin(loginResult: LoginManagerLoginResult)
    func goToHome()
    
}

protocol LoginRouterProtocol {
    func routeToHome()
}

protocol LoginConfiguratorProtocol {
    func configure(_ view: LoginViewProtocol)
}

protocol LoginInteractorProtocol{
    var presenter: LoginPresenterProtocol! { get set }
    var dataManager: LoginDataManagerProtocol! { get set }
    func socialLogin(view:LoginViewProtocol)
    func successSocialLogin(loginResult:LoginManagerLoginResult)
}

protocol LoginDataManagerProtocol{
    var interactor: LoginInteractorProtocol! { get set }
    func socialLogin(view: LoginViewProtocol)
}
