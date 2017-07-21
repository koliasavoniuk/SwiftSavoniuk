//
//  IDPUser.swift
//  IDPSwiftSavoniuk
//
//  Created by Student002 on 7/11/17.
//  Copyright © 2017 Student002. All rights reserved.
//

import Foundation

class IDPUser: NSObject {
    var id: String = ""
    var name: String = ""
    var gender: String = ""
    var email: String = ""
    var friends: NSDictionary = [:]
    var pictureURL: String = ""
    
    init(id: String, name: String, pictureURL: String) {
        self.id = id
        self.name = name
        self.pictureURL = pictureURL
    }
    
    func initWithDictionary (dictionary: NSDictionary) {
        self.id = dictionary.value(forKey: constId) as! String
        self.name = dictionary.value(forKey: constName) as! String
        self.gender = dictionary.value(forKey: constGender) as! String
        self.email = dictionary.value(forKey: constEmail) as! String
        self.friends = dictionary.value(forKey: constFriends) as! NSDictionary
        self.pictureURL = dictionary.value(forKey: constPicture) as! String
    }
}
