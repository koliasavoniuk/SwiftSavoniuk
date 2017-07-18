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

class IDPBaseContext : IDPObservableObject {

    func execute (object: Any) {
    }
    
    func cancel () {
        
    }
}
