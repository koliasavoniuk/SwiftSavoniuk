//
//  IDPFacebookViewController.swift
//  IDPSwiftSavoniuk
//
//  Created by Student002 on 7/7/17.
//  Copyright © 2017 Student002. All rights reserved.
//

import UIKit

import FacebookLogin
import FacebookCore
import FBSDKCoreKit
import FBSDKLoginKit

class IDPFacebookViewController: UIViewController {

    let myLoginButton = LoginButton(readPermissions: [ .publicProfile, .email, .userFriends ])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if AccessToken.current != nil {
            print (getFriends(funcP: fetchProfile))
        }
        
        //prepareLoginButton()
        addCustomButton()
    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func prepareLoginButton () {
        let loginButton = LoginButton(readPermissions: [ .publicProfile, .email, .userFriends ])
        loginButton.center = view.center
        
        view.addSubview(loginButton)
    }
    
    func addCustomButton() {
        // Add a custom login button to your app
        let myLoginButton = UIButton(type: .custom)
        myLoginButton.backgroundColor = UIColor.darkGray
        myLoginButton.frame = CGRect(x: 0, y: 0, width: 180, height: 40);
        
        myLoginButton.center = view.center;
        myLoginButton.setTitle("My Login Button", for: .normal)
        
        // Handle clicks on the button
        myLoginButton.addTarget(self, action: #selector(self.loginButtonClicked), for: .touchUpInside)
        
        // Add the button to the view
        view.addSubview(myLoginButton)
    }
    
    @objc func loginButtonClicked() {
        let loginManager = LoginManager()
        loginManager.logIn([ .publicProfile ], viewController: self) { loginResult in
            switch loginResult {
            case .failed(let error):
                print(error)
            case .cancelled:
                print("User cancelled login.")
            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                let result = self.getFriends(funcP: self.fetchProfile)
                print(result)
            }
        }
    }

    public func getFriends(funcP: @escaping (Any?)->Void) -> Any {
        let fbRequestFriends: FBSDKGraphRequest = FBSDKGraphRequest(
            graphPath:"me/friends",
            parameters:["fields": "id,name,about,gender,birthday,email,picture,friends.limit(100){picture,name}"])
        
        fbRequestFriends.start { (connection, result, error) in
            if error == nil && result != nil {
                funcP(result)
            } else {
                print("Error +++++++++++++++++++++++++++\(String(describing: error))")
            }
        }
        return "getFriends"
    }
/*
    func fetchProfile(result:Any?) {
        
        print("fetch profile-----------------------------------------------------------------")
        
        let dic = result as! NSDictionary

        print("Request Friends result : \(dic)")
    }
*/
    
    func fetchProfile(result:Any?) {
        
        print("fetch profile")
        
        let dictionary = result as! NSDictionary
        
        let friends = dictionary.value(forKey: "data") as! NSArray
        var count = 1
        if let array = friends as? [NSDictionary] {
            for friend : NSDictionary in array {
                let name = friend.value(forKey: "name") as! NSString
                print("\(count) \(name)")
                count += 1
            }
        }
    }
    
}
