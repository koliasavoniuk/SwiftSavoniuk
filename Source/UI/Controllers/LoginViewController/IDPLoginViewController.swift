//
//  IDPLoginViewController.swift
//  IDPSwiftSavoniuk
//
//  Created by Student002 on 7/14/17.
//  Copyright © 2017 Student002. All rights reserved.
//

import UIKit

class IDPLoginViewController: UIViewController {
    
    public var didFinishAuthorization = false {
        didSet {
            NotificationCenter.default.post(
                name: NSNotification.Name(rawValue:kIDPAuthorizationDidChange),
                object: nil, userInfo: [:])
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func onLogin(_ sender: UIButton) {
        IDPLoginContext().execute(object: self) { _ in
            self.didFinishAuthorization = true
        }
    }
}
