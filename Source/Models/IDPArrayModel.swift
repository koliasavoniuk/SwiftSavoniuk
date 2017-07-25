//
//  IDPArrayModel.swift
//  IDPSwiftSavoniuk
//
//  Created by Student002 on 7/12/17.
//  Copyright © 2017 Student002. All rights reserved.
//

import Foundation

class IDPArrayModel<T: Equatable>: NSObject {
    
    var friends: Array<T> = []
    
    var count: Int {
        get {
            return self.friends.count
        }
    }
        
    func addObject(object: T) {
        self.friends.append(object)
    }
    
    func removeObject(object: T) {
        self.friends = self.friends.filter { $0 != object }
    }
    
    func addObjects(objects: [T]) {
        for object in objects {
            addObject(object: object)
        }
    }
    
    func removeObjects(objects: [T]) {
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
}
