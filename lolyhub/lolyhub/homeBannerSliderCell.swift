//
//  homeBannerSliderCell.swift
//  lolyhub
//
//  Created by Apple on 22/02/17.
//  Copyright © 2017 webwerks. All rights reserved.
//

import UIKit

class homeBannerSliderCell: UITableViewCell {

    @IBOutlet weak var homeBannerSliderPageControl: UIPageControl!
    @IBOutlet weak var homeBannerSlider: iCarousel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
