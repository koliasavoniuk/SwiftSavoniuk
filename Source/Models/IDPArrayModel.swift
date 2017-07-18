//
//  IDPArrayModel.swift
//  IDPSwiftSavoniuk
//
//  Created by Student002 on 7/12/17.
//  Copyright © 2017 Student002. All rights reserved.
//

import Foundation

class IDPArrayModel: NSObject {
    
    var friends: NSMutableArray = []
    
    static let sharedInstance = IDPArrayModel()
    
    var count: Int {
        get {
            return self.friends.count
        }
    }
        
    func addObject(object: Any) {
        self.friends.add(object)
    }
    
    func removeObject(object: Any) {
        self.friends.remove(object)
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
        return self.friends[index] as! IDPUser
    }
    
    subscript(index: Int) -> NSObject {
        get { return self.friends[index] as! NSObject }
    }
    
    func setObjectAtIndex(object: IDPUser, index: Int) {
        self.friends.insert(object, at: index)
    }
    
}
