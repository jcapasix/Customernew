//
//  LoginViewController.swift
//  Customernew
//
//  Created by Jordan Capa on 7/10/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FBSDKLoginKit

class LoginViewController: UIViewController {

    var presenter: LoginPresenterProtocol!
    
    let loginButton = FBLoginButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = LoginConfigurator.sharedInstance.configure(self)
        self.initView()
    }
    
    func initView(){
        self.loginButton.center = view.center
        self.loginButton.delegate = self
        self.loginButton.permissions = ["public_profile", "email"]

        view.addSubview(loginButton)
        
    }
    
    @IBAction func socialLoginButtonPressed(_ sender: Any) {
        self.presenter.socialLogin()
    }
    

}

extension LoginViewController: LoginViewProtocol{
    
}

extension LoginViewController: LoginButtonDelegate{
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        
    }

    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        
        if error == nil{
            self.presenter.successSocialLogin()
        }
    }
    
}



