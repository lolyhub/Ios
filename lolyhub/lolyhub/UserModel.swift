//
//  UserModel.swift
//  lolyhub
//
//  Created by Apple on 25/04/17.
//  Copyright © 2017 webwerks. All rights reserved.
//

import Foundation


class User:NSObject {
    
    enum userDefaultsKeys:String {
        case userId = "UserID"
        case firstName = "firstname"
        case lastName = "lastname"
        case mobile = "mobile"

    }
    
    private static var sharedInstance : User?
    
    var userId : String?
    var firstname : String?
    var lastname : String?
    var mobile : String?

    
    //MARK:- Getter and Logout Functions
    class func setInstance(user:User) -> User  {
        
        User.sharedInstance = user
        return User.sharedInstance!
    }
    
    class func getInstance() -> User {
        
        if User.sharedInstance == nil{
            User.sharedInstance = User()
            User.sharedInstance?.pullUserData()
        }
        return User.sharedInstance!
    }
    
    //MARK:- Helper Functions
    private func pullUserData()
    {
        let defaults = UserDefaults.standard
        self.userId = defaults.object(forKey: userDefaultsKeys.userId.rawValue) as? String
        self.firstname = defaults.object(forKey: userDefaultsKeys.firstName.rawValue) as? String
        self.lastname = defaults.object(forKey: userDefaultsKeys.lastName.rawValue) as? String
        self.mobile = defaults.object(forKey: userDefaultsKeys.mobile.rawValue) as? String
        
    }
    
    //MARK:- Setter Functions
    func commitChanges()
    {
        let defaults = UserDefaults.standard
        
        defaults.set(self.userId, forKey: userDefaultsKeys.userId.rawValue)
        defaults.set(self.firstname, forKey: userDefaultsKeys.firstName.rawValue)
        defaults.set(self.lastname, forKey: userDefaultsKeys.lastName.rawValue)
        defaults.set(self.mobile, forKey: userDefaultsKeys.mobile.rawValue)
        
    }

}
