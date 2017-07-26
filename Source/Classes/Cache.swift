//
//  Cache.swift
//  IDPSwiftSavoniuk
//
//  Created by Student002 on 7/26/17.
//  Copyright © 2017 Student002. All rights reserved.
//

import UIKit

class  Cache: NSObject {
    
    // MARK: Computable property
    
    var count: Int {
        get {
            return self.imageModelDict.count
        }
    }
    
    // MARK: Private property
    
    public private(set) var imageModelDict = NSMapTable<NSString,  ImageModel>(keyOptions: .strongMemory, valueOptions: .weakMemory)
    private let lockQueue = DispatchQueue(label: "\(hash.self)")
    
    // MARK: Shared Instance
    
    static let sharedInstance =  Cache()
    
    // MARK: Public functions
    
    func set(model:  ImageModel, for key: NSString) {
        lockQueue.async {
            self.imageModelDict.setObject(model, forKey: key)
        }
    }
    
    func removeModel(for key: NSString) {
        lockQueue.async {
            self.imageModelDict.removeObject(forKey: key)
        }
    }
    
    func model(for key: NSString) ->  ImageModel? {
        lockQueue.async {
            return self.imageModelDict.object(forKey: key)
        }
        
        return nil
    }
}
