//
//  IDPUsersViewController.swift
//  IDPSwiftSavoniuk
//
//  Created by Student002 on 7/14/17.
//  Copyright © 2017 Student002. All rights reserved.
//

import UIKit

class IDPUsersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var userFriendsTableView: UITableView?
    
    var usersModel = IDPUsersModel.sharedInstance
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reusableCell = tableView.reusableCellWithClass(IDPUserCell.self, for: indexPath) { (result) in
            result.user = (usersModel[indexPath.row] as! IDPUser)
        }
        return reusableCell
    }
}
