//
//  RestClient.swift
//  lolyhub
//
//  Created by Apple on 11/04/17.
//  Copyright © 2017 webwerks. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class RestClient {
    
    // baseURL
    static let baseURLString = "http://lolyhubmobile.azurewebsites.net/Service1.svc/"
    
    // post method
    class func post(url: String,parameters: [String:AnyObject], onSuccess: @escaping (_ respObject:AnyObject) -> Void, onError: @escaping (_ errorObject:AnyObject) -> Void) {
        
        let endPoint = RestClient.baseURLString + url
        
        Alamofire.request(endPoint, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseJSON {
            
            response in
            
            print("here is the response ")
            
            print("jsonResponse :\(response)")
            
            print("responseINJSon :\(response.result.value)")
            
            if(response.result.isSuccess) {
                let respObject = response.result.value!
                
                onSuccess(respObject as AnyObject)
            }
            
            else {
                onError(response.response?.statusCode as AnyObject)
            }
            
            
            
            
            
        }
        
        
    }
    
    
    
    
    
    
    /*
    // apiCall alamofire method
    class func apiCall(method: Alamofire.Method, url:String,parameters: [String:AnyObject], onSuccess: (_ respObject : AnyObject) -> Void, onError: (_ errorObject : AnyObject) -> Void, code:Int) {
        
        let tempUrl = RestClient.baseURLString + url
        let finalURL = NSURL(string: tempUrl)!
        print("finalURL =>\(finalURL)")
        print("parameters =>\(parameters)")
        let URLRequest = NSMutableURLRequest(url: finalURL as URL)
        URLRequest.httpMethod = method.debugDescription
    }
    */
    
    
}

