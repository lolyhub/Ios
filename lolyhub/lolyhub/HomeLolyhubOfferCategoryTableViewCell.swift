//
//  HomeLolyhubOfferCategoryTableViewCell.swift
//  lolyhub
//
//  Created by Apple on 02/03/17.
//  Copyright © 2017 webwerks. All rights reserved.
//

import UIKit

class HomeLolyhubOfferCategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var viewMoreButton: UIButton!
    
    // lolySpecialView1
    @IBOutlet weak var lolySpecialView1: UIView!
    @IBOutlet weak var lolySpecialImageView1: UIImageView!
    @IBOutlet weak var lolySpecialRedeemPointLabel1: UILabel!
    @IBOutlet weak var lolySpecialEarningLabel1: UILabel!
    
    // lolySpecialView2
    @IBOutlet weak var lolySpecialView2: UIView!
    @IBOutlet weak var lolySpecialImageView2: UIImageView!
    @IBOutlet weak var lolySpecialRedeemPointLabel2: UILabel!
    @IBOutlet weak var lolySpecialEarningLabel2: UILabel!
    
    // lolySpecialView3
    @IBOutlet weak var lolySpecialView3: UIView!
    @IBOutlet weak var lolySpecialImageView3: UIImageView!
    @IBOutlet weak var lolySpecialRedeemPointLabel3: UILabel!
    @IBOutlet weak var lolySpecialEarningLabel3: UILabel!
    
    // lolySpecialView4
    @IBOutlet weak var lolySpecialView4: UIView!
    @IBOutlet weak var lolySpecialImageView4: UIImageView!
    @IBOutlet weak var lolySpecialRedeemPointLabel4: UILabel!
    @IBOutlet weak var lolySpecialEarningLabel4: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

