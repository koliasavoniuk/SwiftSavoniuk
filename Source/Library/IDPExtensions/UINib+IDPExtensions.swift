//
//  UINib+IDPExtensions.swift
//  IDPSwiftSavoniuk
//
//  Created by Student002 on 7/17/17.
//  Copyright © 2017 Student002. All rights reserved.
//

import Foundation
import UIKit

extension UINib {
    class func nib(with viewClass: AnyClass) -> UINib {
        return self.nib(with: viewClass, bundle: nil)
    }
    
    class func nib(with viewClass: AnyClass, bundle: Bundle?) -> UINib {
        return UINib(nibName: String(describing:viewClass), bundle: bundle)
    }
    
    class func objectWithType<Result>(_ type: Result.Type) -> Result? {
        return self.objectWithType(type, owner: nil)
    }
    
    class func objectWithType<Result>(_ type: Result.Type, owner: AnyObject?) -> Result? {
        return self.objectWithType(type, owner: nil, options: nil)
    }
    
    class func objectWithType<Result>(
        _ type: Result.Type,
        owner: AnyObject?,
        options: [AnyHashable : Any]?
        )
        -> Result?
    {
        let nib = self.nib(with: type as! AnyClass)
        
        return cast(nib.objectWithType(type, owner: owner, options: options))
    }
    
    func objectWithType<Result>(_ type: Result.Type) -> Result? {
        return self.objectWithType(type, owner: nil)
    }
    
    func objectWithType<Result>(_ type: Result.Type, owner: AnyObject?) -> Result? {
        return self.objectWithType(type, owner: owner, options: nil)
    }
    
    func objectWithType<Result>(
        _ type: Result.Type,
        owner: AnyObject?,
        options: [AnyHashable : Any]?
        )
        -> Result?
    {
        let objects = self.instantiate(withOwner: owner, options: options)
        
        return cast(objects.object(type: type))
    }
}

