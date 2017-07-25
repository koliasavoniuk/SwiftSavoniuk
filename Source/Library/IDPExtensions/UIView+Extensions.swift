//
//  UIView+Extensions.swift
//  SwiftSavoniuk
//
//  Created by Student002 on 7/17/17.
//  Copyright © 2017 Student002. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    class func viewController() -> Self {
        return self.init(nibName: self.nibName(), bundle: nil)
    }
    
    class func nibName() -> String? {
        return nil
    }
}
