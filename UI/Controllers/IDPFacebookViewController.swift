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
        
        IDPCustomButtonContext().execute(object: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func loginButtonClick() {
        IDPLoginContext().execute(object: self)
    }
}
