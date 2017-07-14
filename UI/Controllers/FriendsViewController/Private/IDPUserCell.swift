//
//  IDPUserCell.swift
//  IDPSwiftSavoniuk
//
//  Created by Student002 on 7/14/17.
//  Copyright © 2017 Student002. All rights reserved.
//

import UIKit

class IDPUserCell: UITableViewCell {
    
    @IBOutlet var userImageView: UIView?
    @IBOutlet var fullNameLabel: UILabel?
    
    func initCell() {
        self.fullNameLabel = UILabel()
        self.userImageView = UIView()
    }
    
    var user: IDPUser? {
        didSet {
            self.fillWithUser(user: user!)
        }
    }
    
    func fillWithUser(user: IDPUser) {
        self.fullNameLabel?.text = user.name
    }
    
}
