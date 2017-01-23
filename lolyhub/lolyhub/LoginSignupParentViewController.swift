//
//  LoginSignupParentViewController.swift
//  lolyhub
//
//  Created by webwerks on 1/9/17.
//  Copyright © 2017 webwerks. All rights reserved.
//

import UIKit

class LoginSignupParentViewController: UIViewController {

   
    @IBOutlet weak var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        print("signIn signUp is here")
        
       // self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
        
        print("signUp clicked")
        let signUpView = UIStoryboard.signupViewController()
        self.navigationController?.pushViewController(signUpView, animated: true)
    }
    
    
    @IBAction func loginClicked(_ sender: Any) {
        
        let loginView = UIStoryboard.loginViewController()
        self.navigationController?.pushViewController(loginView, animated: true)
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
