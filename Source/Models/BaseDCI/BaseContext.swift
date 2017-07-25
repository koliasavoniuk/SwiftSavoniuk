//
//  BaseContext.swift
//  SwiftSavoniuk
//
//  Created by Student002 on 7/10/17.
//  Copyright © 2017 Student002. All rights reserved.
//

import Foundation

enum ContextState: Int {
    case didUnload, didLoad, didFailLoading, willLoad
}

typealias CompletionHandler = (_ success:Bool) -> Void

class BaseContext : ObservableObject {

    func execute (object: AnyObject, completionHandler: @escaping CompletionHandler) {
        
    }
    
    func cancel () {
        
    }
}
