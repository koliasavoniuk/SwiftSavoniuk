//
//  IDPNavigationViewController.swift
//  IDPSwiftSavoniuk
//
//  Created by Student002 on 7/17/17.
//  Copyright © 2017 Student002. All rights reserved.
//

import UIKit

import FacebookLogin
import FacebookCore

class IDPNavigationViewController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pushLoginViewController()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func pushLoginViewController() {
        self.pushViewController(IDPLoginViewController.viewController(), animated: true)
    }
    
    func pushUsersViewController() {
        self.pushViewController(IDPUsersViewController.viewController(), animated: true)
    }
}
