//
//  IDPFillArrayContext.swift
//  IDPSwiftSavoniuk
//
//  Created by Student002 on 7/18/17.
//  Copyright © 2017 Student002. All rights reserved.
//

import Foundation

import FacebookLogin
import FacebookCore

class IDPFillArrayContext: IDPBaseContext {
    
    private var myGraphRequest: GraphRequest? = GraphRequest(graphPath: "/me/friends", parameters: ["fields" : ""], accessToken: AccessToken.current, httpMethod: .GET, apiVersion: .defaultVersion)
    
    override func execute(object: Any) {
        if self.myGraphRequest != nil {
            self.myGraphRequest!.start { (response, result) in
                switch result {
                case .failed(let error):
                    print("Error in grahp request:", error)
                    break
                case .success(let GraphResponse):
                    if let responseDictionary = GraphResponse.dictionaryValue {
                        print(responseDictionary)
                        self.processDataWithUsersModel(dictionary: responseDictionary as NSDictionary?, model: IDPArrayModel.sharedInstance)
                        //fillTableView
                        
                        IDPNavigationViewController.sharedInstance.pushUsersViewController()
                    }
                }
            }
        }
    }
    
    override func cancel() {
        self.myGraphRequest = nil
    }
    
    private func processDataWithUsersModel(dictionary: NSDictionary?, model: IDPArrayModel) {
        var userID = ""
        var userName = ""
        if let data = dictionary?["data"] as? Array<NSDictionary> {
            for user in data {
                if let id = user["id"] as? String {
                    userID = id
                }
                if let name = user["name"] as? String {
                    userName = name
                }
                let user = IDPUser(id: userID, name:userName)
                model.addObject(object: user)
            }
        } else {
            print("Error during serialization")
        }
    }
}
