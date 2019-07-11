//
//  LoginConfigurator.swift
//  Customernew
//
//  Created by Jordan Capa on 7/10/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation

class LoginConfigurator: LoginConfiguratorProtocol {
    
    public static let sharedInstance = LoginConfigurator()
    
    func configure(_ view: LoginViewProtocol) {
        
        let dataManager = LoginDataManager()
        let interactor = LoginInteractor()
        
        interactor.dataManager = dataManager
        dataManager.interactor = interactor
        
        let router = LoginRouter(view: view as! LoginViewController)
        let presenter = LoginPresenter(view: view, router: router, interactor: interactor)
        
        interactor.presenter = presenter
        view.presenter = presenter
    }
}
