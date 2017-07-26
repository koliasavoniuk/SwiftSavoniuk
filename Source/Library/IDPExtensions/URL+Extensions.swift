//
//  URL+Extensions.swift
//  IDPSwiftSavoniuk
//
//  Created by Student002 on 7/26/17.
//  Copyright © 2017 Student002. All rights reserved.
//

import UIKit

extension URL {
    func nameGenerating() -> String? {
        let fileNameEncoding = self.relativePath.addingPercentEncoding(withAllowedCharacters: .alphanumerics)
        
        return fileNameEncoding
    }
}
