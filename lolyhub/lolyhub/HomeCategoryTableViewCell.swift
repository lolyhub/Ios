//
//  HomeCategoryTableViewCell.swift
//  lolyhub
//
//  Created by Apple on 23/02/17.
//  Copyright © 2017 webwerks. All rights reserved.
//

import UIKit

class HomeCategoryTableViewCell: UITableViewCell {

   
    @IBOutlet weak var HomeCategoryCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension HomeCategoryTableViewCell {
    
    func setCollectionViewDataSourceDelegate<D: UICollectionViewDataSource & UICollectionViewDelegate>(_ dataSourceDelegate: D, forRow row: Int) {
        
        HomeCategoryCollectionView.delegate = dataSourceDelegate
        HomeCategoryCollectionView.dataSource = dataSourceDelegate
        HomeCategoryCollectionView.tag = row
        HomeCategoryCollectionView.setContentOffset(HomeCategoryCollectionView.contentOffset, animated:false) // Stops collection view if it was scrolling.
        HomeCategoryCollectionView.reloadData()
    }
    
//    var collectionViewOffset: CGFloat {
//        set { collectionView.contentOffset.x = newValue }
//        get { return collectionView.contentOffset.x }
//    }
}
