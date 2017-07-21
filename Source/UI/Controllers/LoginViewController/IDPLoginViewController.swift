//
//  IDPLoginViewController.swift
//  IDPSwiftSavoniuk
//
//  Created by Student002 on 7/14/17.
//  Copyright © 2017 Student002. All rights reserved.
//

import UIKit

class IDPLoginViewController: IDPViewController {
    
    var loginContext: IDPLoginContext?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginContext = IDPLoginContext()
        self.navigationController?.isNavigationBarHidden = true
        self.observer = loginContext?.observationController(observer: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func onLogin(_ sender: UIButton) {
        loginContext?.execute(object: self) {_ in
            IDPFillArrayContext().execute(object: self) {_ in
                IDPNavigationViewController.sharedInstance.pushUsersViewController()
            }
        }
    }
    
    //MARK: IDPViewController override
    override func prepare(observer: IDPObservationController?) {
        let handler = {(controller: IDPObservationController, userInfo: Any?) ->
            Void in
        }
        
        observer?.set(handler: handler, for: IDPContextState.didLoad.rawValue)
    } 
}
