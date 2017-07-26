//
//  ArrayModel.swift
//  SwiftSavoniuk
//
//  Created by Student002 on 7/12/17.
//  Copyright © 2017 Student002. All rights reserved.
//

import Foundation

class ArrayModel<T: Equatable>: Model {
    
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
    
    func objectAtIndex(index: Int) -> T {
        return self.friends[index]
    }
    
    subscript(index: Int) -> T {
        get { return self.friends[index] }
    }
}
