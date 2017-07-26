//
//  FileManager+Extensions.swift
//  IDPSwiftSavoniuk
//
//  Created by Student002 on 7/26/17.
//  Copyright © 2017 Student002. All rights reserved.
//

import Foundation
import UIKit

extension FileManager {
    
    // MARK: Class properties
    
    class var libraryFolderURL: URL {
        return self.url(for: .libraryDirectory)
    }
    
    class var documentsFolderURL: URL { // ask about class let
        return self.url(for: .documentDirectory)
    }
    
    class var myFolderURL: URL {
        let manager = FileManager.default
        return manager.folderURL(with: "MyFolder")
    }
    
    class func fileExist(in path: String) -> Bool {
        return self.default.fileExists(atPath: path)
    }
    
    // MARK: Class methods
    
    class func url(for directory: FileManager.SearchPathDirectory) -> URL {
        let url: String = NSSearchPathForDirectoriesInDomains(directory, .userDomainMask, true)[0]
        
        return URL(fileURLWithPath: url)
    }
    
    // MARK: Instanse methods
    
    func folderURL(with name: String) -> URL {
        let libraryURL: URL = FileManager.libraryFolderURL
        let filePath = URL(fileURLWithPath: libraryURL.absoluteString).appendingPathComponent(name)
        do {
            try FileManager.default.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
        } catch {
            print("Error: Folder can't be created")
        }
        
        return filePath
    }
}
