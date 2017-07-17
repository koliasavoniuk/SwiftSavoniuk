//
//  IDPUsersModel.swift
//  IDPSwiftSavoniuk
//
//  Created by Student002 on 7/12/17.
//  Copyright © 2017 Student002. All rights reserved.
//

import Foundation

class IDPUsersModel: NSObject {
    
    var users: NSMutableArray = []
    
    static let sharedInstance = IDPUsersModel()
    
    var count: Int {
        get {
            return self.users.count
        }
    }
    
    func addObject(object: Any) {
        self.users.add(object)
    }
    
    func removeObject(object: Any) {
        self.users.remove(object)
    }
    
    func addObjects(objects: NSArray) {
        for object in objects {
            addObject(object: object)
        }
    }
    
    func removeObjects(objects: NSArray) {
        for object in objects {
            removeObject(object: object)
        }
    }
    
    func objectAtIndex(index: Int) -> IDPUser {
        return self.users[index] as! IDPUser
    }
    
    subscript(index: Int) -> NSObject {
        get { return self.users[index] as! NSObject }
    }
    
    func setObjectAtIndex(object: IDPUser, index: Int) {
        self.users.insert(object, at: index)
    }
    
}
