//
//  TableViewCell.swift
//  SwiftSavoniuk
//
//  Created by Student002 on 7/18/17.
//  Copyright © 2017 Student002. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    override var reuseIdentifier: String? {
        return String(describing:type(of:self))
    }
    
}
