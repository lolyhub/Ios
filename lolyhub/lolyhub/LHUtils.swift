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
    
    class func productListViewController() -> ProductListViewController {
        return mainStoryboard().instantiateViewController(withIdentifier: "ProductListViewController") as! ProductListViewController
    }
    
    class func productDetailViewController() -> ProductDetailViewController {
        return mainStoryboard().instantiateViewController(withIdentifier: "ProductDetailViewController") as! ProductDetailViewController
    }
    
}

extension UIFont{
    
    class func setOpenSansBold(size : CGFloat)-> UIFont {
        return UIFont(name: "OpenSans-Bold", size: size)!
    }

    class func setOpenSansBoldItalic(size : CGFloat)-> UIFont {
        return UIFont(name: "OpenSans-BoldItalic", size: size)!
    }
    class func setOpenSansExtraBold(size : CGFloat)-> UIFont {
        return UIFont(name: "OpenSans-ExtraBold", size: size)!
    }
    class func setOpenSansExtraBoldItalic(size : CGFloat)-> UIFont {
        return UIFont(name: "OpenSans-ExtraBoldItalic", size: size)!
    }
    class func setOpenSansItalic(size : CGFloat)-> UIFont {
        return UIFont(name: "OpenSans-Italic", size: size)!
    }
    class func setOpenSansLight(size : CGFloat)-> UIFont {
        return UIFont(name: "OpenSans-Light", size: size)!
    }
    class func setOpenSansLightItalic(size : CGFloat)-> UIFont {
        return UIFont(name: "OpenSans-LightItalic", size: size)!
    }
    class func setOpenSansRegular(size : CGFloat)-> UIFont {
        return UIFont(name: "OpenSans-Regular", size: size)!
    }
    class func setOpenSansSemibold(size : CGFloat)-> UIFont {
        return UIFont(name: "OpenSans-Semibold", size: size)!
    }
    class func setOpenSansSemiboldItalic(size : CGFloat)-> UIFont {
        return UIFont(name: "OpenSans-SemiboldItalic", size: size)!
    }

}
