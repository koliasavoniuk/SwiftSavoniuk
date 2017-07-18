//
//  IDPViewController.swift
//  IDPSwiftSavoniuk
//
//  Created by Student002 on 7/18/17.
//  Copyright © 2017 Student002. All rights reserved.
//

import UIKit

class IDPViewController: UIViewController {

    var observer: IDPObservationController? {
        didSet {
            if observer != oldValue {
                self.prepare(observer: observer)
            }
        }
    }

    // should be overriden in subclasses
    func prepare(observer: IDPObservationController?) {
    
    }
}
