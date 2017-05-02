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

func presentLoginSignUpViewOnViewController(currentViewController:UIViewController) {
    
    let loginSignUpView = UIStoryboard.loginSignUpNavigationController()
    
    currentViewController.navigationController?.present(loginSignUpView, animated: true, completion: nil)
    
}


func addBackArrowButton(on currentViewController:UIViewController) {
    
    let backImage = UIImage(named: "backArrow")
    currentViewController.navigationController?.navigationBar.backIndicatorImage = backImage
    currentViewController.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backImage
    
    
    currentViewController.navigationController?.navigationBar.tintColor = UIColor.black
    
    currentViewController.navigationController?.navigationBar.backItem?.title = ""
    
    
}

func addNavigationTitleImage(on currentViewControler:UIViewController) {
    
    let logoImageName = UIImage(named: "navigationBarImage")
    let imageLogo = UIImageView(image: logoImageName)
    currentViewControler.navigationItem.titleView = imageLogo
    
}




