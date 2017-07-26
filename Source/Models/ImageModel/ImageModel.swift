//
//  ImageModel.swift
//  IDPSwiftSavoniuk
//
//  Created by Student002 on 7/26/17.
//  Copyright © 2017 Student002. All rights reserved.
//

import UIKit

typealias loadWithCompletion = (_ image:UIImage, _ error: Error?) -> Void
let kFriendImageDidChange = "friendImageDidChange"

class  ImageModel:  Model {
    
    // MARK: Public properties
    
    let cache =  Cache.sharedInstance
    var image: UIImage? {
        didSet {
            NotificationCenter.default.post(
                name: NSNotification.Name(rawValue:kFriendImageDidChange),
                object: nil,
                userInfo: [:])
        }
    }
    var url: URL?
    var localPath: URL {
        get {
            let fileName = self.url?.nameGenerating()
            let localURL = URL.init(fileURLWithPath: "\(FileManager.libraryFolderURL.path)/\(String(describing: fileName))")
            
            return localURL
        }
    }
    
    // MARK: Class functions
    
    class func model<Result>(with url: URL) -> Result? {
        let cache =  Cache.sharedInstance
        let model = cache.model(for: url.path as NSString)
        if model != nil {
            return cast(model!)
        } else {
            
            let model = url.isFileURL ?  FileSystemModel(with: url) :  InternetImageModel(with: url)
            cache.set(model: model, for: url.path as NSString)
            
            return cast(model)
        }
    }
    
    // MARK: Initializations and Deallocations
    
    init(with url: URL) {
        super.init()
        self.url = url
        self.performLoading()
    }
    
    // MARK: Public functions
    
    func removeCachedFile() {
        let manager = FileManager.default
        do {
            try manager.removeItem(at: localPath)
        } catch {
            print("Error during removing file at localPath")
        }
    }
    
    override func performLoading() {
        self.loadWithCompletion { (image, error) in
            if error != nil {
                print(error!)
            } else {
                DispatchQueue.main.async {
                    self.image = image
                    self.state =  ModelState.didLoad.rawValue
                }
            }
        }
    }
    
    // MARK : Functions for overriding
    
    func loadWithCompletion(_ completion: @escaping loadWithCompletion) {
        
    }
}

