//
//  InternetImageModel.swift
//  IDPSwiftSavoniuk
//
//  Created by Student002 on 7/26/17.
//  Copyright © 2017 Student002. All rights reserved.
//

import UIKit

class  InternetImageModel:  FileSystemModel {
    
    // MARK: Public properties
    
    var sessionTask = URLSessionDownloadTask() {
        didSet {
            sessionTask.resume()
        }
    }
    
    var isVeryfied: Bool {
        get {
            let image = UIImage(contentsOfFile: self.localPath.path)
            return nil != image
        }
    }
    var isCached: Bool {
        let manager = FileManager.default
        return manager.fileExists(atPath: self.localPath.path)
    }
    
    // MARK: Override
    
    override func loadWithCompletion(_ completion: @escaping (UIImage, Error?) -> Void) {
        if (self.isCached) {
            super.loadWithCompletion({ (image, error) in
                if (self.isVeryfied) {
                    completion(image, error)
                } else {
                    self.removeCachedFile()
                    self.downloadWithCompletion(completion)
                }
            })
        } else {
            self.downloadWithCompletion(completion)
        }
    }
    
    // MARK: Private functions
    
    private func downloadWithCompletion(_ completion: @escaping (UIImage, Error?) -> Void) {
        let manager = FileManager.default
        let localURL = self.localPath
        let urlSession = URLSession.init(configuration: .ephemeral)
        self.sessionTask = urlSession.downloadTask(with: self.url!, completionHandler: { (location, response, error) in
            if let location = location {
                do {
                    try manager.moveItem(at: location, to: localURL)
                } catch {
                    print("Error during downloading Image")
                }
            }
            let image = UIImage(contentsOfFile: localURL.path)
            completion(image!, error)
        })
    }
}

