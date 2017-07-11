//
//  IDPFacebookViewController.swift
//  IDPSwiftSavoniuk
//
//  Created by Student002 on 7/7/17.
//  Copyright © 2017 Student002. All rights reserved.
//

import UIKit

import FacebookLogin
import FacebookCore
import FBSDKCoreKit
import FBSDKLoginKit

class IDPFacebookViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addCustomButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func addCustomButton() {
        let myLoginButton = UIButton(type: .custom)
        myLoginButton.backgroundColor = UIColor.darkGray
        myLoginButton.frame = CGRect(x: 0, y: 0, width: 180, height: 40);
        
        myLoginButton.center = view.center;
        myLoginButton.setTitle("My Login Button", for: .normal)
        
        myLoginButton.addTarget(self, action: #selector(self.loginButtonClicked), for: .touchUpInside)
        
        view.addSubview(myLoginButton)
    }
    
    @objc func loginButtonClicked() {
        let loginManager = LoginManager()
        loginManager.logIn([ .publicProfile, .email, .userFriends ], viewController: self) { loginResult in
            switch loginResult {
            case .failed(let error):
                print(error)
            case .cancelled:
                print("User cancelled login.")
            case .success( _, _, _):
                //DownloadFriendsContext().execute()
                TestContext().execute()
            }
        }
    }
}
