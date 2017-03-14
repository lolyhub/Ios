//
//  LoginViewController.swift
//  lolyhub
//
//  Created by webwerks on 1/9/17.
//  Copyright © 2017 webwerks. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin


class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // navigation back button
        addBackArrowButton(on: self)
        
        setupView()
        
        
        
        // Do any additional setup after loading the view.
    }
    
    func setupView() {
        
        
        self.title = "Log in"
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSFontAttributeName: UIFont.setOpenSansBold(size: 18)]
        
        self.usernameTextField.stylePrimaryTextField()
         self.passwordTextField.stylePasswordHelperTextField()
        
    }
    
    @IBAction func facebookLoginClicked(_ sender: Any) {
        
        let fbloginManager = LoginManager()
        
        fbloginManager.logIn([.publicProfile], viewController: self) { (LoginResult) in
            switch LoginResult {
            case .failed(let error):
                print("fblogin error : \(error)")
            case .cancelled:
                print("user cancelled fb login")
            case .success(grantedPermissions: let grantP, declinedPermissions: let declinedP, token: let fbaccessToken):
                print("fb login successful")
                
                
            }
        }
        
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - UITextField delegate methods
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
