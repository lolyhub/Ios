//
//  LoginViewController.swift
//  lolyhub
//
//  Created by webwerks on 1/9/17.
//  Copyright © 2017 webwerks. All rights reserved.
//

import UIKit

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
      //  self.passwordTextField.stylePrimaryTextField()
        
        self.passwordTextField.stylePasswordHelperTextField()
        
//        let rightImageView = UIImageView()
//        rightImageView.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
//        let passwordHelpImage = UIImage(named: "passwordHelpIcon")
//        rightImageView.image = passwordHelpImage
//        self.passwordTextField.rightViewMode = UITextFieldViewMode.always
//        self.passwordTextField.rightView = rightImageView
        
        
        
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
