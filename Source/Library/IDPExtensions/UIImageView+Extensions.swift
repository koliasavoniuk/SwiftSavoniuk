//
//  UIImageView+Extensions.swift
//  IDPSwiftSavoniuk
//
//  Created by Student002 on 7/21/17.
//  Copyright © 2017 Student002. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func setImageFromURl(stringImageUrl urlString: String){
        
        if let url = NSURL(string: urlString) {
            if let data = NSData(contentsOf: url as URL) {
                self.image = UIImage(data: data as Data)
            }
        }
    }
}
