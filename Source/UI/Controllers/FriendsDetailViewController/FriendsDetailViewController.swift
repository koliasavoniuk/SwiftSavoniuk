//
//  FriendsDetailViewController.swift
//  SwiftSavoniuk
//
//  Created by Student002 on 7/19/17.
//  Copyright © 2017 Student002. All rights reserved.
//

import UIKit

class FriendsDetailViewController: UIViewController {
    
    @IBOutlet var userPicture: UIImageView?
    @IBOutlet var userName: UILabel?
    @IBOutlet var userGender: UILabel?
    @IBOutlet var userEmail: UILabel?
    
    private var name = ""
    private var gender = ""
    private var email = ""
    private var pictureURL = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false

        self.fillFields()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func fillWithUser(user: User) {
        self.pictureURL = user.pictureURL
        self.name  = user.name
        self.gender = user.gender
        self.email = user.email
    }
    
    func fillFields() {
        self.userPicture?.setImageFromURl(stringImageUrl: (self.pictureURL))
        self.userName?.text = self.name
        self.userGender?.text = self.gender
        self.userEmail?.text = self.email
    }
    
    /*private func configureImageView(with user:  User?) {
        if let picture = user?.picture {
            let imageModel:  ImageModel =  ImageModel.model(with: URL(string: picture)!)!
            self.userPicture?.imageModel = imageModel
        }
        self.isLoading = false
    }*/
}
