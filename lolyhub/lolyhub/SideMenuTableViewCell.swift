//
//  SideMenuTableViewCell.swift
//  lolyhub
//
//  Created by webwerks on 17/05/17.
//  Copyright © 2017 webwerks. All rights reserved.
//

import UIKit

class SideMenuTableViewCell: UITableViewCell {
    @IBOutlet var sideMenuImageView: UIImageView!

    @IBOutlet var sideMenuLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
