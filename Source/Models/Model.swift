//
//  Model.swift
//  IDPSwiftSavoniuk
//
//  Created by Student002 on 7/26/17.
//  Copyright © 2017 Student002. All rights reserved.
//

import UIKit

enum  ModelState: Int {
    case didUnload,
    willLoad,
    didLoad,
    failLoading
}

class  Model:  ObservableObject {
    
    private let lockQueue = DispatchQueue(label: "\(hash.self)")
    
    func load() {
        lockQueue.async {
            let state = self.state
            
            if ( ModelState.willLoad.rawValue == state ||  ModelState.didLoad.rawValue == state) {
                self.state =  ModelState.willLoad.rawValue
                self.notify(state: state, object: nil)
                return
            }
            
            self.state =  ModelState.willLoad.rawValue
        }
        
        DispatchQueue.global(qos: .background).async {
            self.performLoading()
        }
    }
    
    // You should override this method for correct loading in subclasses. Do not call it directly.
    func performLoading() {
        
    }
}
