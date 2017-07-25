//
//  ObservationController.swift
//  SwiftSavoniuk
//
//  Created by Student002 on 7/18/17.
//  Copyright © 2017 Student002. All rights reserved.
//

import UIKit

typealias StateChangeHandler = (ObservationController, Any?) -> Void

class ObservationController: Comparable {
    var observer: AnyObject?
    var observableObject: AnyObject?
    var states: Dictionary = [Int : Any]()
    
    init(observer: AnyObject, observableObject: AnyObject) {
        self.observer = observer
        self.observableObject = observableObject
    }
    
    func set(handler: @escaping StateChangeHandler, for state: Int) {
        self.states[state] = handler
    }
    
    func remove(handler: @escaping StateChangeHandler, for state: Int) {
        self.states[state] = nil
    }
    
    func handler(for state: Int) -> StateChangeHandler? {
        return self.states[state] as? StateChangeHandler
    }
    
    subscript(index: Int) -> Any? {
        get{
            return self.handler(for: index)
        }
        set {
            self.set(handler: newValue as! StateChangeHandler, for: index)
        }
    }
    
    func notify(state: Int, object: Any? = nil) {
        if let handler = self[state] as? StateChangeHandler {
            handler(self, object)
        }
    }
    
    // MARK: Comparable protocol
    
    static func < (lhs: ObservationController, rhs: ObservationController) -> Bool {
        return false
    }
    
    static func == (lhs: ObservationController, rhs: ObservationController) -> Bool {
        return lhs === rhs
    }
}

