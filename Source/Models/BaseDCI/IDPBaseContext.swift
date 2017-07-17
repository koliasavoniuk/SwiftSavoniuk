//
//  IDPBaseContext.swift
//  IDPSwiftSavoniuk
//
//  Created by Student002 on 7/10/17.
//  Copyright © 2017 Student002. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ success: Bool) -> Void

class IDPBaseContext : NSObject {

    func execute (object: Any, completionHandler: @escaping CompletionHandler) {
        completionHandler(true)
    }
    
    func cancel () {
        
    }
}
