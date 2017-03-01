//
//  HomeSingleCategoryTableViewCell.swift
//  lolyhub
//
//  Created by Apple on 01/03/17.
//  Copyright © 2017 webwerks. All rights reserved.
//

import UIKit

class HomeSingleCategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var HomeSingleCategoryCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension HomeSingleCategoryTableViewCell {
    
    func setCollectionViewDataSourceDelegate<D: UICollectionViewDataSource & UICollectionViewDelegate>(_ dataSourceDelegate: D, forRow row: Int) {
        
        HomeSingleCategoryCollectionView.delegate = dataSourceDelegate
        HomeSingleCategoryCollectionView.dataSource = dataSourceDelegate
        HomeSingleCategoryCollectionView.tag = row
        HomeSingleCategoryCollectionView.setContentOffset(HomeSingleCategoryCollectionView.contentOffset, animated:false) // Stops collection view if it was scrolling.
        HomeSingleCategoryCollectionView.reloadData()
    }
    
    //    var collectionViewOffset: CGFloat {
    //        set { collectionView.contentOffset.x = newValue }
    //        get { return collectionView.contentOffset.x }
    //    }
}
