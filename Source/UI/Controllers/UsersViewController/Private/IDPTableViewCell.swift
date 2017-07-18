//
//  IDPTableViewCell.swift
//  IDPSwiftSavoniuk
//
//  Created by Student002 on 7/18/17.
//  Copyright © 2017 Student002. All rights reserved.
//

import UIKit

class IDPTableViewCell: UITableViewCell {
    
    override var reuseIdentifier: String? {
        return String(describing:type(of:self))
    }
    
}
