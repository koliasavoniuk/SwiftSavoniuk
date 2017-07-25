//
//  LoginViewController.swift
//  SwiftSavoniuk
//
//  Created by Student002 on 7/14/17.
//  Copyright © 2017 Student002. All rights reserved.
//

import UIKit

class LoginViewController: ViewController {
    
    var loginContext: LoginContext?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginContext = LoginContext()
        self.navigationController?.isNavigationBarHidden = true
        self.observer = loginContext?.observationController(observer: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func onLogin(_ sender: UIButton) {
        loginContext?.execute(object: self) {_ in
            let controller = UsersViewController.viewController()
            controller.usersModel = UsersModel()
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    //MARK: ViewController override
    override func prepare(observer: ObservationController?) {
        let handler = {(controller: ObservationController, userInfo: Any?) ->
            Void in
        }
        
        observer?.set(handler: handler, for: ContextState.didLoad.rawValue)
    } 
}
