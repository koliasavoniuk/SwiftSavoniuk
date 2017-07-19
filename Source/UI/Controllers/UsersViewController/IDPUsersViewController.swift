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
    
    static let usersViewController = IDPUsersViewController()
    
    var arrayModel = IDPArrayModel.sharedInstance
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initMainView()
        
        IDPUsersViewController.usersViewController.navigationController?.navigationBar.isHidden = true
    }

    private func initMainView() -> () {
        if self.mainView == nil {
            self.mainView = self.view as UIView
        }
    }
    
    // MARK: UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reusableCell = tableView.reusableCellWithClass(IDPUserCell.self, for: indexPath) { (result) in
            result.user = (arrayModel[indexPath.row] as! IDPUser)
        }
        return reusableCell
    }
}
