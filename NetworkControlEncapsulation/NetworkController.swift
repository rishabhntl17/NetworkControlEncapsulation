//
//  NetworkController.swift
//  NetworkControlEncapsulation
//
//  Created by Appinventiv on 3/20/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//

import Foundation

class NetworkController
{
    func get(URL : String, parameters : [[String:Any]], headers : [String:String] = [String:String](), success : @escaping ([String:Any]) -> Void, failure : @escaping (Error) -> Void)
    {
        var url = URL
        url.append("?")
        for params in parameters
        {
            for (key,val) in params
            {
                url = url + key + "=" + (val as! String)
            }
            url.append("&")
        }
        if  url.last == "&"
        {
            url.removeLast()
        }
        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error!)
            }
            do{
                guard let JsonData = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String:Any]
                    else{
                        failure(error!)
                        return
                }
                success(JsonData)
            }catch{

                failure(error)
            }
        })
        dataTask.resume()
    }
    
    
    func post(URL : String, parameters : [[String:Any]], headers : [String:String] = [String:String](), success : @escaping ([String:Any]) -> Void, failure : @escaping (Error) -> Void)
    {
        let request = NSMutableURLRequest(url: NSURL(string: URL)! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        var bodyString = ""
        
        for params in parameters
        {
            for (key,val) in params{
                bodyString = bodyString + key + "=" + (val as! String)
                bodyString.append("&")
            }
        }
        if  bodyString.last == "&"
        {
            bodyString.removeLast()
        }
        request.httpBody = bodyString.data(using: String.Encoding.utf8)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error!)
            }
            do{
                guard let JsonData = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String:Any]
                    else{
                        failure(error!)
                        return
                }
                success(JsonData)
            }catch{
                
                failure(error)
            }
        })
        dataTask.resume()
    }
}


