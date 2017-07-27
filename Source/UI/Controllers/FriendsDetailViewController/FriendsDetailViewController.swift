//
//  FriendsDetailViewController.swift
//  SwiftSavoniuk
//
//  Created by Student002 on 7/19/17.
//  Copyright © 2017 Student002. All rights reserved.
//

import UIKit

class FriendsDetailViewController: UIViewController {
    
    @IBOutlet var friendDetailView: FriendDetailView?
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = false
        self.initMainView()
        self.friendDetailView?.currentUser = user
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK : Private functions
    
    private func initMainView() {
        if nil == self.friendDetailView {
            self.friendDetailView = self.view as? FriendDetailView
        }
    }
}
