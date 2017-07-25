//
//  ObservableObject.swift
//  SwiftSavoniuk
//
//  Created by Student002 on 7/18/17.
//  Copyright © 2017 Student002. All rights reserved.
//

import UIKit

typealias ControllerNotificationBlock = (ObservationController) -> Void

class ObservableObject: NSObject {
    var observationControllers: NSHashTable<ObservationController> = NSHashTable.weakObjects()
    
    // setters for state
    var state: Int = 0 {
        didSet{
            if state != oldValue {
                self.notify(state: state)
            }
        }
    }
    
    func set(state: Int, for object: Any?) {
        if self.state != state {
            self.state = state
            self.notify(state: state, object: object)
        }
    }
    
    // add-remove controller methods
    func observationController(observer: Any?) -> ObservationController {
        let controller = ObservationController(observer: observer as AnyObject, observableObject: self)
        self.observationControllers.add(controller)
        
        return controller
    }
    
    func invalidate(controller: ObservationController) {
        self.observationControllers.remove(controller)
    }
    
    // notify methods
    func notify(state: Int, object: Any? = nil) {
        self.notify(state: state, handler: { (controller: ObservationController) in
            controller.notify(state: state, object: object)
        })
    }
    
    func notify(state: Int, handler: ControllerNotificationBlock?) {
        if handler == nil {
            return
        }
        
        for controller in observationControllers.objectEnumerator() {
            handler?(controller as! ObservationController)
        }
    }
}

