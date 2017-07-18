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
    
    static let sharedInstanceNavigation = IDPNavigationViewController()
    
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

    func authorizationDidFinish() {
                    self.pushViewController(IDPUsersViewController.viewController(), animated: true)
    }
    /*
    func authorizationDidFinish() {
        NotificationCenter.default.addObserver(
            forName: NSNotification.Name(rawValue:kIDPAuthorizationDidChange),
            object: nil,
            queue: nil) { (Notification) in
                if AccessToken.current != nil {
                    
                    self.pushViewController(IDPUsersViewController.viewController(), animated: true)
                }
        }
    }
    */
}
