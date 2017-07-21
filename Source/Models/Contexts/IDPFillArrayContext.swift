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
    
    private var myGraphRequest: GraphRequest? = GraphRequest(graphPath: "/me/friends", parameters: ["fields" : "id, name, birthday, picture.type(large), email"], accessToken: AccessToken.current, httpMethod: .GET, apiVersion: .defaultVersion)
    
    override func execute(object: Any, completionHandler: @escaping CompletionHandler) {
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
                        completionHandler(true)
                    }
                }
            }
        }
    }
    
    override func cancel() {
        self.myGraphRequest = nil
    }
    
    private func processDataWithUsersModel(dictionary: NSDictionary?, model: IDPArrayModel) {
        var userID: String?
        var userName: String?
        var userPicture: String?
        if let data = dictionary?["data"] as? Array<NSDictionary> {
            for user in data {
                if let id = user["id"] as? String {
                    userID = id
                }
                if let name = user["name"] as? String {
                    userName = name
                }
                if let data = user["picture"] as? [String : Any] {
                    let urlData = data["data"] as? [String: Any]
                    userPicture = urlData?["url"] as? String
                    //userPicture = picture
                }
                let user = IDPUser(id: userID!, name:userName!, pictureURL:userPicture!)
                model.addObject(object: user)
            }
        } else {
            print("Error during serialization")
        }
    }
}
