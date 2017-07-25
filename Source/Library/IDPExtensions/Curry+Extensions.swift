//
//  Curry+Extensions.swift
//  SwiftSavoniuk
//
//  Created by Student002 on 7/24/17.
//  Copyright © 2017 Student002. All rights reserved.
//

import Foundation

public func curry<A, B, C>(_ f : @escaping (A, B) -> C) -> (A) -> (B) -> C {
    
    return { (a : A) -> (B) -> C in
        { (b : B) -> C in
            
            f(a, b)
        }
    }
    
}




public func curry<A, B, C, D>(_ f : @escaping (A, B, C) -> D) -> (A) -> (B) -> (C) -> D {
    
    return { (a : A) -> (B) -> (C) -> D in
        { (b : B) -> (C) -> D in
            { (c : C) -> D in
                
                f(a, b, c)
            }
        }
    }
    
}
