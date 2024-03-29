//
//  Utils.swift
//  Customernew
//
//  Created by Jordan Capa on 7/10/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation
import UIKit

class Utils{
    
    static func showAlert(title:String, message:String, view:UIViewController){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(ok)
        view.present(alert, animated: true, completion: nil)
    }
    
//    static func showAlert(error:ErrorEntity, view:UIViewController){
//        let alert = UIAlertController(title: error.title, message: error.message, preferredStyle: .alert)
//        let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
//        alert.addAction(ok)
//        view.present(alert, animated: true, completion: nil)
//    }
    
    static func isValidEmail(email:String) -> Bool {
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    static func isKeyPresentInUserDefaults(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }
    
    static func getDateSrting() -> String{
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return format.string(from: date)
    }
}
