//
//  IDPFriendsDetailViewController.swift
//  IDPSwiftSavoniuk
//
//  Created by Student002 on 7/19/17.
//  Copyright © 2017 Student002. All rights reserved.
//

import UIKit

class IDPFriendsDetailViewController: UIViewController {
    
    @IBOutlet var userPicture: UIImageView?
    @IBOutlet var userName: UILabel?
    @IBOutlet var userGender: UILabel?
    @IBOutlet var userEmail: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func fillWithUser(user: IDPUser){
        self.userPicture?.setImageFromURl(stringImageUrl: (user.pictureURL))
        self.userName?.text = user.name
        self.userGender?.text = user.gender
        self.userEmail?.text = user.email
    }
}
