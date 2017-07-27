//
//  UIImageView+Extensions.swift
//  SwiftSavoniuk
//
//  Created by Student002 on 7/21/17.
//  Copyright © 2017 Student002. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func setImageFromURl(stringImageUrl urlString: String){
        
        NSURL(string: urlString).do {
            NSData(contentsOf: $0 as URL).do {
                self.image = UIImage(data: $0 as Data)
            }
        }
    }
}
