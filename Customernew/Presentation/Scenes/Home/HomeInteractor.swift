//
//  HomeInteractor.swift
//  Customernew
//
//  Created by Jordan Capa on 7/11/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation
import FirebaseAuth
import SVProgressHUD
import FBSDKLoginKit

class HomeInteractor: HomeInteractorProtocol {
    
    var presenter: HomePresenterProtocol!
    var dataManager: HomeDataManagerProtocol!
    
    func newCustomer(customer:Customer){
        self.dataManager.newCustomer(customer: customer)
    }
    
    func logoutUser(){
        SVProgressHUD.show()
        
        let loginManager = LoginManager()
        loginManager.logOut()
        
//        if Auth.auth().currentUser != nil{
//            SVProgressHUD.dismiss()
//            do{
//                try Auth.auth().signOut();
//                self.presenter.logoutConfirm(rpt: true)
//            }catch{
//                self.presenter.logoutConfirm(rpt: false)
//            }
//        }
        self.presenter.logoutConfirm(rpt: true)
    }
    
}
