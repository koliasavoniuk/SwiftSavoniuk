//
//  IDPFillUserContext.swift
//  IDPSwiftSavoniuk
//
//  Created by Student002 on 7/13/17.
//  Copyright © 2017 Student002. All rights reserved.
//

import Foundation

import FBSDKCoreKit

class IDPFillUserContext: IDPBaseContext {
    
    override func execute(object: Any, completionHandler: @escaping CompletionHandler) {
        let fbRequestFriends: FBSDKGraphRequest =
            FBSDKGraphRequest(
                graphPath:"me",
                parameters:["fields": "id,name,gender,email,friends"])
        
        fbRequestFriends.start { (connection, result, error) in
            
            if error == nil && result != nil {
                completionHandler(true)
                let user = IDPUser()
                let dictionary = result as! NSDictionary
                user.initWithDictionary(dictionary: dictionary)
                let usersModel = IDPUsersModel()
                usersModel.addObject(object: user)
            } else {
                print("Error\(String(describing: error))")
            }
        }
    }
}
