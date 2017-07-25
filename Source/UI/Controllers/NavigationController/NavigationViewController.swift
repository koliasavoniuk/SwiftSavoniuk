//
//  NavigationViewController.swift
//  SwiftSavoniuk
//
//  Created by Student002 on 7/17/17.
//  Copyright © 2017 Student002. All rights reserved.
//

import UIKit

import FacebookLogin
import FacebookCore

class NavigationViewController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pushViewController(LoginViewController(), animated: true)
    }
}
