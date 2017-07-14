//
//  IDPCustomButtonContext.swift
//  IDPSwiftSavoniuk
//
//  Created by Student002 on 7/14/17.
//  Copyright © 2017 Student002. All rights reserved.
//

import UIKit

import FacebookLogin
import FacebookCore
import FBSDKCoreKit
import FBSDKLoginKit

class IDPCustomButtonContext: IDPBaseContext {
    override func execute(object: Any) {
        let myLoginButton = UIButton(type: .custom)
        myLoginButton.backgroundColor = UIColor.darkGray
        myLoginButton.frame = CGRect(x: 0, y: 0, width: 180, height: 40);
        myLoginButton.center = (object as AnyObject).view.center;
        myLoginButton.setTitle("My Login Button", for: .normal)
        myLoginButton.addTarget(self, action: #selector(self.loginButtonClick), for: .touchUpInside)

        (object as AnyObject).view.addSubview(myLoginButton)
    }

    func loginButtonClick() {
        IDPLoginContext().execute(object: self)
    }

}
