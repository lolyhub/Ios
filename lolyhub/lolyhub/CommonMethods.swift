//
//  CommonMethods.swift
//  lolyhub
//
//  Created by webwerks on 1/15/17.
//  Copyright © 2017 webwerks. All rights reserved.
//

import UIKit
import Foundation


//sideMenu setup
func addSideMenuFunctionality(to sideButton: UIBarButtonItem, on currentViewController: UIViewController)
{

    if currentViewController.revealViewController() != nil {
    
        sideButton.target = currentViewController.revealViewController()
        sideButton.action = #selector(SWRevealViewController.revealToggle(_:))
        currentViewController.view.addGestureRecognizer(currentViewController.revealViewController().panGestureRecognizer())
        
    }
    
}


