//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"






//func curry<A, B, C>(_ function: @escaping (A, B) -> C) -> (A) -> (B) -> C {
//    return { (a: A) ->
//    }
//}
//
//func curry<A, B, C, D>(_ function: @escaping (A, B, C) -> D) -> (A) -> (B) -> (C) -> D {
//    return { arg in
//        { return function(arg, $0) }
//    }
//}

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


let addFunc:(Int,Int,Int) -> Int = {$0 + $1 + $2}

addFunc(3, 1, 6)

let curryAdd = curry(addFunc)

curryAdd(3)(1)(6)
