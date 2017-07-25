//
//  NSArray+Extensions.swift
//  SwiftSavoniuk
//
//  Created by Student002 on 7/17/17.
//  Copyright © 2017 Student002. All rights reserved.
//

import Foundation

extension Array {
    func object<Result>() -> Result? {
        return self.object(type: Result.self)
    }
    
    func object<Result>(type: Result.Type) -> Result? {
        return self
            .flatMap { cast($0) }
            .first
    }
}
