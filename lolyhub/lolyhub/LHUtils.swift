//
//  LHUtils.swift
//  lolyhub
//
//  Created by webwerks on 1/23/17.
//  Copyright © 2017 webwerks. All rights reserved.
//

import Foundation
import UIKit
import SVProgressHUD


class LHUtils : NSObject {
    
    static func showLoadingView() {
        
        SVProgressHUD.show()
        SVProgressHUD.setDefaultAnimationType(SVProgressHUDAnimationType.flat)
        SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.light)
        SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.black)
        SVProgressHUD.show(withStatus: "Loading..")
        
    }
    
    static func hideLoadingView() {
        SVProgressHUD.dismiss()
    }
    
    static func showAlertWith(title:String, message:String, viewController:UIViewController) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(okAction)
        viewController.present(alert, animated: true, completion: nil)
        
    }
    
    
    class func JSONStringify(value: AnyObject,prettyPrinted:Bool = false) -> String{
        
        let options = prettyPrinted ? JSONSerialization.WritingOptions.prettyPrinted : JSONSerialization.WritingOptions(rawValue: 0)
        
        if JSONSerialization.isValidJSONObject(value) {
            
            do{
                let data = try JSONSerialization.data(withJSONObject: value, options: options)
                if let string = NSString(data: data, encoding: String.Encoding.utf8.rawValue) {
                    return string as String
                }
            }catch {
                print("error")
            }
            
        }
        return ""
    }

    
}


extension UIStoryboard {

    //Main Storyboard
    class func mainStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    class func loginSignUpNavigationController() -> LoginSignUpNavigationController {
        
        return mainStoryboard().instantiateViewController(withIdentifier: "LoginSignUpNavigationController") as! LoginSignUpNavigationController
        
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


extension Array where Element: Equatable {
    mutating func removeObject(object: Element) {
        if let index = self.index(of: object) {
            self.remove(at: index)
        }
    }
}
