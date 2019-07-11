//
//  HomeRouter.swift
//  Customernew
//
//  Created by Jordan Capa on 7/11/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation
import UIKit

class HomeRouter: HomeRouterProtocol {
    
    fileprivate weak var view: HomeViewController?
    
    init(view: HomeViewController) {
        self.view = view
    }
    
    func routeToNewCustomer(){
        let newCustomerViewController = NewCustomerViewController()
        newCustomerViewController.delegate = view
        view?.present(newCustomerViewController, animated: true, completion: nil)
    }
    
    func routeToLogin(){
        
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            
            let newWindow = UIWindow()
            appDelegate.replaceWindow(newWindow)
            newWindow.rootViewController = UINavigationController(rootViewController: LoginViewController())
        }
    }
}
