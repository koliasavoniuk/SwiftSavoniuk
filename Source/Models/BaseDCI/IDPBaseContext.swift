//
//  IDPBaseContext.swift
//  IDPSwiftSavoniuk
//
//  Created by Student002 on 7/10/17.
//  Copyright © 2017 Student002. All rights reserved.
//

import Foundation

enum IDPContextState: Int {
    case didUnload, didLoad, didFailLoading, willLoad
}

typealias CompletionHandler = (_ success: Bool) -> Void

class IDPBaseContext : IDPObservableObject {

    func execute (object: Any, completionHandler: @escaping CompletionHandler) {
        completionHandler(true)
    }
    
    func cancel () {
        
    }
}
