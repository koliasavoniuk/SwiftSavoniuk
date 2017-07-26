//
//  UsersViewController.swift
//  SwiftSavoniuk
//
//  Created by Student002 on 7/14/17.
//  Copyright © 2017 Student002. All rights reserved.
//

import UIKit

class UsersViewController: ViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var tableView: UITableView?
    @IBOutlet var mainView: UserView?
        
    var usersModel: UsersModel? {
        didSet {
            if usersModel != oldValue {
                FillArrayContext().execute(object: self) {_ in
                    self.tableView?.reloadData()
                    self.mainView?.isLoading = false
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initMainView()
        self.mainView?.isLoading = true

        self.navigationController?.isNavigationBarHidden = true
    }

    private func initMainView() -> () {
        if self.mainView == nil {
            self.mainView = self.view as? UserView
        }
    }
        
    // MARK-
    // MARK: UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (usersModel?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reusableCell = tableView.reusableCellWithClass(UserCell.self, for: indexPath) { (result) in
            result.user = (usersModel?[indexPath.row] as! User)
        }
        return reusableCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.goToFriendPage(indexPath: indexPath)
    }
    
    // MARK-
    // MARK Private functions
    
    private func goToFriendPage(indexPath: IndexPath) {
        let controller = FriendsDetailViewController()
        controller.fillWithUser(user: usersModel?[indexPath.row] as! User)
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
