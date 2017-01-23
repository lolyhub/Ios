//
//  LHUtils.swift
//  lolyhub
//
//  Created by webwerks on 1/23/17.
//  Copyright © 2017 webwerks. All rights reserved.
//

import Foundation
import UIKit

extension UIStoryboard {

    //Main Storyboard
    class func mainStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    class func loginViewController() -> LoginViewController {
        return mainStoryboard().instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
    }
    
    class func signupViewController() -> SignupViewController {
        return mainStoryboard().instantiateViewController(withIdentifier: "SignupViewController") as! SignupViewController
    }
    
}
