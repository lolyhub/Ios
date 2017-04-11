//
//  WalletTableViewCell.swift
//  lolyhub
//
//  Created by Apple on 05/04/17.
//  Copyright © 2017 webwerks. All rights reserved.
//

import UIKit

class WalletTableViewCell: UITableViewCell {

    
    @IBOutlet weak var exchangeView: UIView!
    
    @IBOutlet weak var exchangeButton: UIButton!
    @IBOutlet weak var exchangeViewHeightConstraint: NSLayoutConstraint!
    
    var isExpanded:Bool = false
        {
        didSet
        {
            if !isExpanded {
                self.exchangeViewHeightConstraint.constant = 0.0
                self.exchangeButton.isHidden = true
                
            } else {
                self.exchangeViewHeightConstraint.constant = 120.0
                self.exchangeButton.isHidden = false
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
