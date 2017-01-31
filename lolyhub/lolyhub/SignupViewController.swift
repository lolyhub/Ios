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

    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var mobileNumberTextField: UITextField!

    
    @IBOutlet weak var genderMaleButton: UIButton!
    @IBOutlet weak var genderFemaleButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addBackArrowButton(on: self)
        setupView()
        setupTextFields()
        self.automaticallyAdjustsScrollViewInsets = false
        self.scrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        
        
        // Do any additional setup after loading the view.
    }

    func setupView() {
        
        self.title = "Sign Up"
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSFontAttributeName: UIFont.setOpenSansBold(size: 18)]
        
        self.genderMaleButton.layer.borderColor = UIColor(red: 197/255.0, green: 198/255.0, blue: 197/255.0, alpha: 1).cgColor
        self.genderFemaleButton.layer.borderColor = UIColor(red: 197/255.0, green: 198/255.0, blue: 197/255.0, alpha: 1).cgColor
        
        
        
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
