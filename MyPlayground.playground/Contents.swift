//: Playground - noun: a place where people can play

import UIKit

extension Optional {

func apply<Value, Result>(_ value: Value?) -> Result?
        where Wrapped == (Value) -> Result
    {
        return self.flatMap { function in
            value.flatMap(function)
        }
    }
}

public func curry<A, B, C, D>(_ f : @escaping (A, B, C) -> D) -> (A) -> (B) -> (C) -> D {
    return { (a : A) -> (B) -> (C) -> D in
        { (b : B) -> (C) -> D in
            { (c : C)  -> D in
                f(a, b, c)
            }
        }
    }
}

func cast<Value, Result>(_ value: Value) -> Result? {
    return value as? Result
}

func threePar(int: Int, string: String, object: String) {
    print(" threePar - \(threePar)" )
    print("par1 = \(int)")
    print("par2 = \(string)")
    print("par3 = \(object)")
}


let dic1:[String : Any]? = ["id" : 15,"name" : "name1","foto" : ["data" : ["Url" : "https://foto1.jpg"]]]
let dic2:[String : Any]? = ["id" : 17,"name" : "name2","foto" : ["data" : ["Url" : "https://foto2.jpg"]]]
let dic3:[String : Any]? = ["id" : 18,"name" : "name3","foto" : ["data" : ["Url" : "https://foto3.jpg"]]]

var arrayData = Optional([dic1,dic2,dic3])

let creator = curry(threePar)

let array1 = arrayData.flatMap {
    $0.flatMap { fbUser in
        var  id = ( fbUser?["id"] as? Int )
        var id2:Int? = cast(fbUser?["id"])
        let dicFoto:[String : [String : Any]]? = cast(fbUser?["foto"])
        id.flatMap(creator)
            .apply( fbUser?["name"] as? String )
            .apply( (cast(dicFoto?["data"]?["Url"]) ?? "") )
    }
}
