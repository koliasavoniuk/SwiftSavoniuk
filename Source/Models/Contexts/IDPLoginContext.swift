//
//  IDPLoginContext.swift
//  IDPSwiftSavoniuk
//
//  Created by Student002 on 7/14/17.
//  Copyright © 2017 Student002. All rights reserved.
//

import Foundation

import FacebookLogin
import FacebookCore

class IDPLoginContext: IDPBaseContext {
    override func execute(object: AnyObject, completionHandler: @escaping CompletionHandler) {
        let loginManager = LoginManager()
        self.state = IDPContextState.willLoad.rawValue
        
        loginManager.logIn([ .publicProfile, .email, .userFriends ], viewController: object as! IDPLoginViewController) { loginResult in
            switch loginResult {
            case .failed(let error):
                print(error)
            case .cancelled:
                print("User cancelled login.")
            case .success( _, _, _):
                completionHandler(true)
            }
        }
    }
}
