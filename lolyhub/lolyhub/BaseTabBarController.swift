//
//  BaseTabBarController.swift
//  lolyhub
//
//  Created by webwerks on 1/12/17.
//  Copyright © 2017 webwerks. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
       // self.revealViewController().rightRevealToggle(animated: true)
        
        
        // Do any additional setup after loading the view.
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if(self.selectedIndex == 4){
            self.revealViewController().rightRevealToggle(animated: true)
        }
        
        
        
    }
    
//    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
//        
//        
//        if(selectedIndex == 4) {
//            self.revealViewController().rightRevealToggle(animated: true)
//            return false
//        }
//        
//        else {
//            return true
//        }
// 
//        
//    }

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
