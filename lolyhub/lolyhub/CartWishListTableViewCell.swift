//
//  CartWishListTableViewCell.swift
//  lolyhub
//
//  Created by Apple on 02/03/17.
//  Copyright © 2017 webwerks. All rights reserved.
//

import UIKit

class CartWishListTableViewCell: UITableViewCell {

   
    @IBOutlet weak var increaseCartButton: UIButton!
    
     @IBOutlet weak var decreaseCartButton: UIButton!
    
    @IBOutlet weak var cartQuantityLabel: UILabel!
    
    @IBOutlet weak var moveToCartLabel: UILabel!
    @IBOutlet weak var cartStatusButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
