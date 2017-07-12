//
//  UserDataObject.swift
//  IDPSwiftSavoniuk
//
//  Created by Student002 on 7/11/17.
//  Copyright © 2017 Student002. All rights reserved.
//

import Foundation

class IDPUser: NSObject {
    var id: String
    var friends: Array<Any> = []
    var name: String = ""
    var gender: String = ""
    var email: String = ""
    
    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
    
    func initFriends(friends: Array<Any>) -> () {
        self.friends = friends
    }
}
