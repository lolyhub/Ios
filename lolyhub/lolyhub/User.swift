//
//  User.swift
//  lolyhub
//
//  Created by Apple on 13/04/17.
//  Copyright © 2017 webwerks. All rights reserved.
//

import Foundation

class UserAPI {
    
    enum LoginEndPoints : String {
        
        case
        login = "login"
        
    }
    
    
    enum UserRequestKeys : String {
            
        case
        userName = "userEmail",
        password = "password"

    }
    
    enum UserResponseKeys : String {
        
        case
        loginResultMessage = "ResultMsg",
        loginSuccessful = "Done",
        loginFailed = "Fail"
        
    }
    
    
}
