//
//  TestDCI.swift
//  IDPSwiftSavoniuk
//
//  Created by Student002 on 7/11/17.
//  Copyright © 2017 Student002. All rights reserved.
//

import Foundation
import FBSDKCoreKit

class TestContext: baseContext {
    override func execute() {
        getFriends()
    }
    
    public func getFriends() {
        let fbRequestFriends: FBSDKGraphRequest =
            FBSDKGraphRequest(
                graphPath:"me/friends",
                parameters:["fields": "id,name,gender,email,picture,friends{picture,name}"])
        
        fbRequestFriends.start { (connection, result, error) in
            
            if error == nil && result != nil {
                let dictionary = result as! NSDictionary
                let friendsss = dictionary.value(forKey: "data") as! NSArray

                if let array = friendsss as? [NSDictionary] {
                    userDataObject().friends = friendsss
                }
                
            } else {
                print("Error\(String(describing: error))")
            }
        }
    }
}



