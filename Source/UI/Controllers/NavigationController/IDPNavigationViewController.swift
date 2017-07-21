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
    
    static let sharedInstance = IDPNavigationViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pushLoginViewController()
    }
    
    func pushLoginViewController() {
        IDPNavigationViewController.sharedInstance.pushViewController(IDPLoginViewController.viewController(), animated: true)
    }
    
    func pushUsersViewController() {
        IDPNavigationViewController.sharedInstance.pushViewController(IDPUsersViewController.viewController(), animated: true)
    }
    
    func pushFriendsDetailVieWController(controller: IDPFriendsDetailViewController) {
        IDPNavigationViewController.sharedInstance.pushViewController(controller, animated: true)
    }   
}
