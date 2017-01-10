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

}

extension UITextField {
    
    func stylePrimaryTextField() {
        
     self.layer.borderColor = LolyHubStyler.primaryTextFieldBorderColor.cgColor
        self.layer.borderWidth = 1

    }
    
    
}
