//
//  UserCell.swift
//  SwiftSavoniuk
//
//  Created by Student002 on 7/14/17.
//  Copyright © 2017 Student002. All rights reserved.
//

import UIKit

class UserCell: TableViewCell {
    
    @IBOutlet var userImageView: UIImageView?
    @IBOutlet var fullNameLabel: UILabel?
    
    var user: User? {
        didSet {self.fillWithUser(user: user!)}
    }
    
//    func initCell() {
//        self.fullNameLabel = UILabel()
//        self.userImageView = UIImageView()
//    }

    func fillWithUser(user: User) {
        self.fullNameLabel?.text = user.name
        self.userImageView?.setImageFromURl(stringImageUrl: (user.pictureURL))
    }
}
