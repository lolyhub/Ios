//
//  HomeViewController.swift
//  lolyhub
//
//  Created by webwerks on 1/12/17.
//  Copyright © 2017 webwerks. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, iCarouselDelegate, iCarouselDataSource {


    @IBOutlet weak var homeBannerSliderPageControl: UIPageControl!
   // @IBOutlet weak var homeBannerSlider: iCarousel!
    
    var bannerCell: homeBannerSliderCell!
    
    
    
    @IBOutlet weak var homeTableView: UITableView!
    @IBOutlet weak var sideMenuButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        setupView()
       //side menu setup
        addSideMenuFunctionality(to: sideMenuButton, on: self)
        
        // Do any additional setup after loading the view.
    }

    func setupView() {
        
        homeTableView.delegate = self
        homeTableView.dataSource = self
        
//        homeTableView.register(UITableViewCell.self, forCellReuseIdentifier: "homeBannerSliderCell")
//        homeTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell2")
//        homeTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell3")
//        
        homeTableView.register(UINib.init(nibName: "HomeSingleCategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeSingleCategoryTableViewCell")
        
//        homeTableView.register(UINib.init(nibName: "HomeSingleCategoryCollectionViewCell", bundle: nil), forCellReuseIdentifier: "HomeSingleCategoryCollectionViewCell")
        
//        homeTableView.register(UITableViewCell.self
//            , forCellReuseIdentifier: "HomeSingleCategoryCollectionViewCell")
//        
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.row == 0) {
            bannerCell = homeTableView.dequeueReusableCell(withIdentifier: "homeBannerSliderCell", for: indexPath) as! homeBannerSliderCell
            
          //  bannercell.homeBannerSlider
            bannerCell.homeBannerSlider.type = .linear
            
//            bannerCell.homeBannerSliderPageControl.addTarget(self, action: Selector(("homeSliderPagerValueChanged:")), for: .valueChanged)
            
            return bannerCell
        }
        
        else if(indexPath.row == 1) {
            let cell2 = homeTableView.dequeueReusableCell(withIdentifier: "HomeCategoryTableViewCell", for: indexPath)
            return cell2
        }
        
        else {
            let cell3 = homeTableView.dequeueReusableCell(withIdentifier: "HomeSingleCategoryTableViewCell", for: indexPath) as! HomeSingleCategoryTableViewCell
            
            
            let oneView = cell3.viewWithTag(100) as! UICollectionView
           // cell3.viewWithTag(1)
            oneView.register(UINib.init(nibName: "HomeSingleCategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeSingleCategoryCollectionViewCell")
            
            return cell3
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if(indexPath.row == 1) {
            guard let HomeCategoryTableViewCell = cell as? HomeCategoryTableViewCell else { return }
            
            HomeCategoryTableViewCell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.row)
        }
        
        if(indexPath.row == 2) {
         
            
//            tableView.register(UINib.init(nibName: "HomeSingleCategoryCollectionViewCell", bundle: nil), forCellReuseIdentifier: "HomeSingleCategoryCollectionViewCell")
            
            
            
            
            
            guard let HomeSingleCategoryTableViewCell = cell as? HomeSingleCategoryTableViewCell else { return }
            
            HomeSingleCategoryTableViewCell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.row)
        }
        
    }
    
    
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return 6
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        var itemView: UIImageView
        if let view = view as? UIImageView {
            itemView = view
            //get a reference to the label in the recycled view
            //  label = itemView.viewWithTag(1) as! UILabel
        } else {
            //don't do anything specific to the index within
            //this `if ... else` statement because the view will be
            //recycled and used with other index values later
            itemView = UIImageView(frame: bannerCell.homeBannerSlider.bounds)
            itemView.contentMode = UIViewContentMode.scaleAspectFit
            itemView.image = UIImage(named: "homeSliderSample")
            
        }
        
        return itemView
    }
    
    func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        
        if (option == .spacing) {
            return value * 1.1
        }
        return value
    }
    
    func homeSliderPagerValueChanged(sender:UIPageControl) {
        bannerCell.homeBannerSlider.scrollToItem(at: sender.currentPage, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.row == 0) {
            return 310
        }
        else if(indexPath.row == 1) {
            return 160
        }
        else if(indexPath.row == 2) {
            return 385
        }
        else {
            return 153
        }
    }
    

    @IBAction func sideMenuButtonClicked(_ sender: Any) {
        
        print("hello")
        
        if self.revealViewController() != nil {
        }
        
    }
    
    @IBAction func watchDemoButtonClicked(_ sender: Any) {
        let productListView = UIStoryboard.productListViewController()
        self.navigationController?.pushViewController(productListView, animated: true)
    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if(collectionView.tag == 1) {
            return 6
        }
        else {
            return 3
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        print("theTag :\(collectionView.tag)")
        
        if(collectionView.tag == 1) {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCategoryCollectionViewCell", for: indexPath) as! HomeCategoryCollectionViewCell
            
            cell.homeCategoryCollectionImageView.image = UIImage(named: LolyHubStyler.categoryElectronicsSampleImageName)
            
            return cell

        }
        else {
            
            let firstHomeSingleCategoryCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeSingleCategoryCollectionViewCell", for: indexPath) as! HomeSingleCategoryCollectionViewCell
            
            return firstHomeSingleCategoryCollectionViewCell
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Collection view at row \(collectionView.tag) selected index path \(indexPath)")
    }
}




