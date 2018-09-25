//
//  ViewController.swift
//  DormManager
//
//  Created by Jakub Jażdżyk on 25.09.2018.
//  Copyright © 2018 Jakub Jażdżyk. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FirebaseAuth

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let facebookButton = FBSDKLoginButton()
        facebookButton.center = self.view.center
        facebookButton.delegate = self
        self.view.addSubview(facebookButton)
    }

}

extension ViewController: FBSDKLoginButtonDelegate {
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if let error = error {
            print(error.localizedDescription)
        } else {
            let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
            Auth.auth().signInAndRetrieveData(with: credential) { (authResult, error) in
                if let error = error {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
}
