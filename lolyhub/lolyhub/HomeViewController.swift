//
//  HomeViewController.swift
//  lolyhub
//
//  Created by webwerks on 1/12/17.
//  Copyright © 2017 webwerks. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var sideMenuButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       //side menu setup
        addSideMenuFunctionality(to: sideMenuButton, on: self)
        
        // Do any additional setup after loading the view.
    }


    @IBAction func sideMenuButtonClicked(_ sender: Any) {
        
        print("hello")
        
        if self.revealViewController() != nil {
            
            
            
        }
        
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
