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



class LoginViewController: UIViewController, UITextFieldDelegate, GIDSignInUIDelegate, GIDSignInDelegate {

    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // navigation back button
        addBackArrowButton(on: self)
        
        setupView()
        
        GIDSignIn.sharedInstance().uiDelegate = self
        
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
               
                // ["fields":"email,name"]
                
                // ["fields": "id, name, first_name, last_name, picture.type(large), email"]
                
                let request = GraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, picture.type(large), email"], accessToken: AccessToken.current, httpMethod: .GET, apiVersion: FacebookCore.GraphAPIVersion.defaultVersion)
                request.start { (response, result) in
                    switch result {
                    case .success(let value):
                        print(value.dictionaryValue)
                    case .failed(let error):
                        print(error)
                    }
                }
                
                
            }
        }
        
    }

    
    
    func getFbData() {
        
        
        
    }
    
    @IBAction func googleSignInClicked(_ sender: Any) {
        
       
//        var configureError: NSError?
//        GGLContext.sharedInstance().configureWithError(&configureError)
//        assert(configureError == nil, "Error configuring Google services: \(configureError)")

        
        
        GIDSignIn.sharedInstance().clientID = "708682956745-rnth80n086l3jkrhvo4kode6df24gfmo.apps.googleusercontent.com"
     //   GIDSignIn.sharedInstance().scopes.append("https://www.googleapis.com/auth/plus.login")
     //   GIDSignIn.sharedInstance().scopes.append("https://www.googleapis.com/auth/plus.me")
        
      //  GIDSignIn.sharedInstance().signInSilently()
        
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
        
        GIDSignIn.sharedInstance().signIn()
        
    }
    
    //MARK:Google SignIn Delegate
    func sign(inWillDispatch signIn: GIDSignIn!, error: Error!) {
        // myActivityIndicator.stopAnimating()
    }
    
    // Present a view that prompts the user to sign in with Google
    func sign(_ signIn: GIDSignIn!,
              present viewController: UIViewController!) {
        self.present(viewController, animated: true, completion: nil)
    }
    
    // Dismiss the "Sign in with Google" view
    func sign(_ signIn: GIDSignIn!,
              dismiss viewController: UIViewController!) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //completed sign In
    public func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        if (error == nil) {
            // Perform any operations on signed in user here.
            let userId = user.userID                  // For client-side use only!
            let idToken = user.authentication.idToken // Safe to send to the server
            let fullName = user.profile.name
            let givenName = user.profile.givenName
            let familyName = user.profile.familyName
            let email = user.profile.email
            // ...
        } else {
            print("\(error.localizedDescription)")
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
    
    
    @IBAction func loginClicked(_ sender: Any) {
        
        if((usernameTextField.text?.isEmpty)! || (passwordTextField.text?.isEmpty)!) {
            print("please enter username and password")
        }
        else {
        
            self.view.endEditing(true)
            LHUtils.showLoadingView()
            let parameters : [String : Any] = ["userEmail":usernameTextField.text!,"password":passwordTextField.text!]
            
            RestClient.post(url: "login", parameters: parameters as [String : AnyObject], onSuccess: { (resp) in
                LHUtils.hideLoadingView()
                print("resp is : \(resp)")
                
                if let resultObject = resp as? NSDictionary {
                    let resultMessage:String = resultObject.object(forKey: "ResultMsg") as! String
                    
                    if(resultMessage == "Done") {
                        LHUtils.showAlertWith(title: "Success", message: "Login successful", viewController: self)
                    }
                    
                    else {
                        LHUtils.showAlertWith(title: "Login fail", message: "Username or password is wrong", viewController: self)
                    }
                    
                }
                
                print("login ok")
                
                
                
                
            }, onError: { (error) in
                LHUtils.hideLoadingView()
                print("error :\(error)")
                
                LHUtils.showAlertWith(title: "Oops", message: "Something went wrong. Please try again later", viewController: self)
                print("error occured")
            })
        }
       
        
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
