//
//  FileSystemModel.swift
//  IDPSwiftSavoniuk
//
//  Created by Student002 on 7/26/17.
//  Copyright © 2017 Student002. All rights reserved.
//

import UIKit

class  FileSystemModel:  ImageModel {
    
    // MARK : Override
    
    override func loadWithCompletion(_ completion: @escaping (UIImage, Error?) -> Void) {
        let image = UIImage(contentsOfFile: self.localPath.path)
        completion(image!, nil)
    }
}
