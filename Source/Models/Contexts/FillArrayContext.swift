//
//  FillArrayContext.swift
//  SwiftSavoniuk
//
//  Created by Student002 on 7/18/17.
//  Copyright © 2017 Student002. All rights reserved.
//

import Foundation

import FacebookLogin
import FacebookCore

class FillArrayContext: BaseContext {
    
    private var myGraphRequest: GraphRequest? = GraphRequest(graphPath: "/me/friends", parameters: ["fields" : "id, name, birthday, picture.type(large), email, gender"], accessToken: AccessToken.current, httpMethod: .GET, apiVersion: .defaultVersion)
    
    override func execute(object: AnyObject , completionHandler: @escaping CompletionHandler) {
        if self.myGraphRequest != nil {
            self.myGraphRequest?.start { (response, result) in
                switch result {
                case .failed(let error):
                    print("Error in grahp request:", error)
                    break
                case .success(let GraphResponse):
                    GraphResponse.dictionaryValue.do {
                        self.processDataWithUsersModel(dictionary: $0 as NSDictionary?, model: (object as? UsersViewController)!)
                        completionHandler(true)
                    }
                }
            }
        }
    }
    
    override func cancel() {
        self.myGraphRequest = nil
    }
    
    private func processDataWithUsersModel(dictionary: NSDictionary?, model: UsersViewController) {
        var userID: String?
        var userName: String?
        var userPicture: String?
        var userGender: String?
        //var userEmail: String?
        if let data = dictionary?["data"] as? Array<NSDictionary> {
            for user in data {
                user["id"].do {
                    userID = $0 as? String
                }
                user["name"].do {
                    userName = cast($0)
                }
                user["gender"].do {
                    userGender = $0 as? String
                }
                //if let email = user["email"] as? String {
                //    userEmail = email
                //}
                if let data = user["picture"] as? [String : Any] {
                    let urlData = data["data"] as? [String: Any]
                    userPicture = urlData?["url"] as? String
                }
                let user = User(id: userID!, name:userName!, pictureURL:userPicture!, gender:userGender!)
                model.usersModel?.addObject(object: user)
            }
        } else {
            print("Error during serialization")
        }
    }
}
