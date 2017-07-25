//
//  Optional+Extensions.swift
//  SwiftSavoniuk
//
//  Created by Student002 on 7/17/17.
//  Copyright © 2017 Student002. All rights reserved.
//

import Foundation

func cast<Value, Result>(_ value: Value) -> Result? {
    return value as? Result
}


func unwrap<T>(Value: T?) -> Any {
    var result: Any = 0
    Value.flatMap {result = $0}
    return result
}

extension Optional {
    
    func `do`(_ execute: (Wrapped) -> ()) {
        self.map(execute)
    }
}
