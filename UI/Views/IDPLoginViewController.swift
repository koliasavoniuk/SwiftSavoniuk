//
//  IDPLoginViewController.swift
//  IDPSwiftSavoniuk
//
//  Created by Student002 on 7/14/17.
//  Copyright © 2017 Student002. All rights reserved.
//

import UIKit

class IDPLoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    

    @IBAction func onLogin(_ sender: UIButton) {
        print("LoginViewController")
        
        sender.addTarget(self, action: #selector(self.loginButtonClick), for: .touchUpInside)
        
    }
    
    func loginButtonClick() {
        IDPLoginContext().execute(object: self)
    }

}
