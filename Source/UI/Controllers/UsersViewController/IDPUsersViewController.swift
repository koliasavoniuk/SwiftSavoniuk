//
//  IDPUsersViewController.swift
//  IDPSwiftSavoniuk
//
//  Created by Student002 on 7/14/17.
//  Copyright © 2017 Student002. All rights reserved.
//

import UIKit

class IDPUsersViewController: IDPViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var tableView: UITableView?
    @IBOutlet var mainView: UIView?
        
    var usersModel: IDPUsersModel? {
        didSet {
            if usersModel != oldValue {
                IDPFillArrayContext().execute(object: self) {_ in
                    self.tableView?.reloadData()
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initMainView()
        
        self.navigationController?.navigationBar.isHidden = true
    }

    private func initMainView() -> () {
        if self.mainView == nil {
            self.mainView = self.view as UIView
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
        let reusableCell = tableView.reusableCellWithClass(IDPUserCell.self, for: indexPath) { (result) in
            result.user = (usersModel?[indexPath.row] as! IDPUser)
        }
        return reusableCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.goToFriendPage(indexPath: indexPath)
    }
    
    // MARK-
    // MARK Private functions
    
    private func goToFriendPage(indexPath: IndexPath) {
        let controller = IDPFriendsDetailViewController()
        controller.fillWithUser(user: usersModel?[indexPath.row] as! IDPUser)
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
