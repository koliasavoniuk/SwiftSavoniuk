//
//  DownloadFriendsContext.swift
//  IDPSwiftSavoniuk
//
//  Created by Student002 on 7/11/17.
//  Copyright © 2017 Student002. All rights reserved.
//

import Foundation
import FBSDKCoreKit

class DownloadFriendsContext: baseContext {
    override func execute() {
        getFriends(callBack: self.fetchProfile)
}
    
    public func getFriends(callBack: @escaping (Any?)->Void) -> Any {
        let fbRequestFriends: FBSDKGraphRequest =
            FBSDKGraphRequest(
            graphPath:"me/friends",
            parameters:["fields": "id,name,gender,email,picture,friends{picture,name}"])
        
        fbRequestFriends.start { (connection, result, error) in

            if error == nil && result != nil {
                callBack(result)
            } else {
                print("Error\(String(describing: error))")
            }
        }
        
        return "getFriends"
    }
    
    
    func fetchProfile(result:Any?) {
        let dictionary = result as! NSDictionary
        
        let friends = dictionary.value(forKey: "data") as! NSArray
        var count = 1
        if let array = friends as? [NSDictionary] {
            for friend : NSDictionary in array {
                let name = friend.value(forKey: "name") as! NSString
                print("\(count) \(name)")
                count += 1
            }
        }
    }
}
