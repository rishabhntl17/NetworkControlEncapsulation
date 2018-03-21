//
//  APIController.swift
//  NetworkControlEncapsulation
//
//  Created by Appinventiv on 3/20/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//

import Foundation

class APIController
{
    static func signup(parameters : [[String:Any]], success : @escaping (DataModel) -> Void, failure : @escaping (Error) -> Void)
    {
        let headers = [
            "Cache-Control": "no-cache",
            "Postman-Token": "1b31dd16-8031-4e3b-b6eb-3d1f3ced3146"
        ]
        let signUpGetURL = "https://httpbin.org/get"
        let signUpPostURL = "https://httpbin.org/post"
//        NetworkController().get(URL: signUpGetURL, parameters: parameters, headers: headers, success: { (data) in
//            let args = data["args"] as! [String:String]
//            let datamodel = DataModel(name: args["name"]!, id: args["id"]!, company: args["company"]!, location: args["location"]!)
//            success(datamodel)
//        }) { (error) in
//            failure(error)
//        }

        NetworkController().post(URL: signUpPostURL, parameters: parameters, success: { (data) in
            let args = data["form"] as! [String:String]
            let datamodel = DataModel(name: args["name"]!, id: args["id"]!, company: args["company"]!, location: args["location"]!)
            success(datamodel)
        }) { (error) in
            failure(error)
        }
    }
}
