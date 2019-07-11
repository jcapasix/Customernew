//
//  HomeProtocols.swift
//  Customernew
//
//  Created by Jordan Capa on 7/11/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation
import FBSDKLoginKit

protocol HomeViewProtocol: class {
    var presenter: HomePresenterProtocol! { get set }
}

protocol HomePresenterProtocol: class {
    var router: HomeRouterProtocol { get }
    var interactor: HomeInteractorProtocol { get }
    func logoutUser()
    func logoutConfirm(rpt: Bool)
    func goToNewCustomer()
    func newCustomer(customer:Customer)
}

protocol HomeRouterProtocol {
    func routeToNewCustomer()
    func routeToLogin()
}

protocol HomeConfiguratorProtocol {
    func configure(_ view: HomeViewProtocol)
}

protocol HomeInteractorProtocol{
    var presenter: HomePresenterProtocol! { get set }
    var dataManager: HomeDataManagerProtocol! { get set }
    func newCustomer(customer:Customer)
    func logoutUser()
}

protocol HomeDataManagerProtocol{
    var interactor: HomeInteractorProtocol! { get set }
    func newCustomer(customer:Customer)
}

