//
//  HomeDataManager.swift
//  Customernew
//
//  Created by Jordan Capa on 7/11/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation
import FirebaseAuth
import Firebase
import FBSDKLoginKit
import SVProgressHUD

class HomeDataManager: HomeDataManagerProtocol {
    
    internal var interactor: HomeInteractorProtocol!
    
    fileprivate var storageImagePath = ""
    fileprivate var ref: DatabaseReference = Database.database().reference()
    fileprivate var storageRef: StorageReference  = Storage.storage().reference()
    fileprivate var storageUploadTask: StorageUploadTask!
    
    func newCustomer(customer:Customer){
        SVProgressHUD.show()
        
        self.ref.child("customers").child(customer.name + "\(Int(Date.timeIntervalSinceReferenceDate * 1000))").setValue(customer.toAnyObject()) { (error, databaseReference) in
            
            SVProgressHUD.dismiss()
        }
    }
}

