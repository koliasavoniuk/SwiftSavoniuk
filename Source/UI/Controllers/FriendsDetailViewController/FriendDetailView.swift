//
//  FriendDetailView.swift
//  IDPSwiftSavoniuk
//
//  Created by Student002 on 7/27/17.
//  Copyright © 2017 Student002. All rights reserved.
//

import UIKit

class FriendDetailView: LoadingViewContainer {
    @IBOutlet var userPicture: ImageView?
    @IBOutlet var userName: UILabel?
    @IBOutlet var userGender: UILabel?
    
    // MARK : Public properties
    
    var currentUser: User? {
        didSet {
            self.fill(with: currentUser)
        }
    }
    
    func fill(with user: User?) {
        self.userName?.text = user?.name
        self.userGender?.text = user?.gender
        self.configureImageView(with: currentUser)
        self.isLoading = false
    }
    
    //MARK : Private functions
    
    private func configureImageView(with user: User?) {
        if let picture = user?.pictureURL {
            self.userPicture?.imageModel = ImageModel.model(with: URL(string: picture)!)
        }
        
        self.isLoading = false
    }
}
