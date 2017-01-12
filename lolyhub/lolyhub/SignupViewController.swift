//
//  SignupViewController.swift
//  lolyhub
//
//  Created by webwerks on 1/9/17.
//  Copyright © 2017 webwerks. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var confirmEmailTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var birthDateTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var mobileNumberTextField: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTextFields()
        self.automaticallyAdjustsScrollViewInsets = false
        self.scrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        
        
        // Do any additional setup after loading the view.
    }

    func setupTextFields() {
        
        self.firstNameTextField.stylePrimaryTextField()
        self.lastNameTextField.stylePrimaryTextField()
        self.emailTextField.stylePrimaryTextField()
        self.confirmEmailTextField.stylePrimaryTextField()
        self.usernameTextField.stylePrimaryTextField()
        self.passwordTextField.stylePrimaryTextField()
        self.confirmPasswordTextField.stylePrimaryTextField()
        self.birthDateTextField.stylePrimaryTextField()
        self.genderTextField.stylePrimaryTextField()
        self.countryTextField.stylePrimaryTextField()
        self.stateTextField.stylePrimaryTextField()
        self.mobileNumberTextField.stylePrimaryTextField()
        
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
