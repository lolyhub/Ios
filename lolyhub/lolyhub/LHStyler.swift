//
//  LHStyler.swift
//  lolyhub
//
//  Created by webwerks on 1/9/17.
//  Copyright © 2017 webwerks. All rights reserved.
//

import UIKit
import Foundation


class LolyHubStyler{
    
    //UITextField Colors
    static let primaryTextFieldBorderColor = UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1.0)
    static let viewMoreButtonGreyBorderColor = UIColor(red: 102/255, green: 102/255, blue: 102/255, alpha: 1.0)
    static let homeScreenViewThinGreyBorderColor = UIColor(red: 215/255, green: 215/255, blue: 215/255, alpha: 1.0)
    
    //Images and Icons
    static let hamburgerMenuButtonIconImageName = "hamburgerMenuButtonIcon"
    static let productListCollectionIconImageName = "productListCollectionIcon"
    static let productListTableIconImageName = "productListTableIcon"
    static let cartNotSelectedIconImageName = "cartNotSelected"
    static let cartSelectedIconImageName = "cartSelected"
    static let wishNotSelectedIconImageName = "wishNotSelected"
    static let wishSelectedIconImageName = "wishSelected"
    
    
    // MARK: - sample and demo images
    // sample and demo images
    static let categoryBooksSampleImageName = "categoryBooksSample"
    static let categoryElectronicsSampleImageName = "categoryElectronicsSample"
    static let categoryFoodSampleImageName = "categoryFoodSample"
    static let categoryWatchSampleImageName = "categoryWatchSample"

    
    
    
}

extension UITextField {
    
    func stylePrimaryTextField() {
        
     self.layer.borderColor = LolyHubStyler.primaryTextFieldBorderColor.cgColor
        self.layer.borderWidth = 1

    }
    
    func stylePasswordHelperTextField() {
        
        self.layer.borderColor = LolyHubStyler.primaryTextFieldBorderColor.cgColor
        self.layer.borderWidth = 1
        let rightImageView = UIImageView()
        rightImageView.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        let passwordHelpImage = UIImage(named: "passwordHelpIcon")
        rightImageView.image = passwordHelpImage
        self.rightViewMode = UITextFieldViewMode.always
        self.rightView = rightImageView

    }
    
}

extension UIButton {
    
    func styleViewMoreButton() {
        self.layer.borderColor = LolyHubStyler.viewMoreButtonGreyBorderColor.cgColor
        self.layer.borderWidth = 1
    }
    
}

extension UIView {
    
    func styleHomeScreenViewWithBorder() {
        self.layer.borderWidth = 0.5
        self.layer.borderColor = LolyHubStyler.homeScreenViewThinGreyBorderColor.cgColor
    }
    
}

