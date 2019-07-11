//
//  HomePresenter.swift
//  Customernew
//
//  Created by Jordan Capa on 7/11/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation
import FBSDKLoginKit

class HomePresenter{
    
    fileprivate weak var view: HomeViewProtocol?
    internal let router: HomeRouterProtocol
    internal let interactor: HomeInteractorProtocol
    
    init(view: HomeViewProtocol, router: HomeRouterProtocol, interactor: HomeInteractorProtocol) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
}

extension HomePresenter: HomePresenterProtocol{
    
    func logoutUser(){
        self.interactor.logoutUser()
    }
    
    func logoutConfirm(rpt: Bool){
        self.router.routeToLogin()
    }
    
    func newCustomer(customer:Customer){
        self.interactor.newCustomer(customer: customer)
    }
    
    func goToNewCustomer(){
        self.router.routeToNewCustomer()
    }
    
}
