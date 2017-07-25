//
//  User.swift
//  SwiftSavoniuk
//
//  Created by Student002 on 7/11/17.
//  Copyright © 2017 Student002. All rights reserved.
//

import Foundation

class User: NSObject {
    var id: String = ""
    var name: String = ""
    var gender: String = ""
    var email: String = ""
    var friends: NSDictionary = [:]
    var pictureURL: String = ""
    
    init(id: String, name: String, pictureURL: String, gender: String) {
        self.id = id
        self.name = name
        self.pictureURL = pictureURL
        self.gender = gender
    }
}
