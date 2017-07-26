//
//  UsersModel.swift
//  SwiftSavoniuk
//
//  Created by Student002 on 7/18/17.
//  Copyright © 2017 Student002. All rights reserved.
//

import UIKit

class UsersModel: ArrayModel<User> {
    
    struct Name {
        static let folder = "Projects"
        static let file = "UsersArray.plist"
    }
    
    var url: URL {
        return self.saveFolderURL()
    }
    
    func save() {
        NSKeyedArchiver.archiveRootObject(self.friends, toFile: self.url.path)
    }
    
    override func performLoading() {
        let array = NSKeyedUnarchiver.unarchiveObject(withFile: self.url.path)
        
        if let array: Array<User> = cast(array) {
            self.friends = array
        } else {
        }
    }
    
    private func saveFolderURL() -> URL {
        let manager = FileManager.default
        
        return manager.folderURL(with: Name.folder).appendingPathComponent(Name.file)
    }
    
}
