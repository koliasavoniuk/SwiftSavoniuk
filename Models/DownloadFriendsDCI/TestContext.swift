//
//  TestDCI.swift
//  IDPSwiftSavoniuk
//
//  Created by Student002 on 7/11/17.
//  Copyright © 2017 Student002. All rights reserved.
//

import Foundation
import FBSDKCoreKit

class TestContext: IDPBaseContext {
    override func execute() {
        getFriends()
    }
    
    public func getFriends() {
        
        let fbRequestFriends: FBSDKGraphRequest =
            FBSDKGraphRequest(
                graphPath:"me",
                parameters:["fields": "id,name,gender,email,picture,friends{picture,name}"])
        
        fbRequestFriends.start { (connection, result, error) in
            
            if error == nil && result != nil {
                let dictionary = result as! NSDictionary
                //let friends = dictionary.value(forKey: "data") as! NSArray
                let friends = dictionary.value(forKey: "friends/data") as! NSArray

                if friends is [NSDictionary] {
                    let user = IDPUser()
                   
                    user.showFriends()
                }
                
            } else {
                print("Error\(String(describing: error))")
            }
        }
    }
}
