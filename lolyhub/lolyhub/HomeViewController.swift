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

    // MARK: - setupView
    func setupView() {
        
        homeTableView.delegate = self
        homeTableView.dataSource = self

        homeTableView.register(UINib.init(nibName: LHCellIdefntifiers.homeSingleCategoryTableViewCellIdentifier, bundle: nil), forCellReuseIdentifier: LHCellIdefntifiers.homeSingleCategoryTableViewCellIdentifier)
        
        homeTableView.register(UINib.init(nibName: LHCellIdefntifiers.homeLolyhubOfferCategoryTableViewCellIdentifier, bundle: nil), forCellReuseIdentifier: LHCellIdefntifiers.homeLolyhubOfferCategoryTableViewCellIdentifier)
        
    }
    
    // MARK: - tableView delegate and dataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.row == 0) {
            bannerCell = homeTableView.dequeueReusableCell(withIdentifier: LHCellIdefntifiers.homeBannerSliderCellIdentifier, for: indexPath) as! homeBannerSliderCell

            bannerCell.homeBannerSlider.type = .linear
            
            return bannerCell
        }
        
        else if(indexPath.row == 1) {
            let cell2 = homeTableView.dequeueReusableCell(withIdentifier: LHCellIdefntifiers.homeCategoryTableViewCellIdentifier, for: indexPath)
            return cell2
        }
        
        else if(indexPath.row == 2){
            let cell3 = homeTableView.dequeueReusableCell(withIdentifier: LHCellIdefntifiers.homeSingleCategoryTableViewCellIdentifier, for: indexPath) as! HomeSingleCategoryTableViewCell
            
            
            let firstSingleCategoryView = cell3.viewWithTag(100) as? UICollectionView
            firstSingleCategoryView?.register(UINib.init(nibName: LHCellIdefntifiers.homeSingleCategoryCollectionViewCellIdentifier, bundle: nil), forCellWithReuseIdentifier: LHCellIdefntifiers.homeSingleCategoryCollectionViewCellIdentifier)
            
            return cell3
        }
        else if(indexPath.row == 3){
            
            let cell4 = homeTableView.dequeueReusableCell(withIdentifier: LHCellIdefntifiers.homeSingleCategoryTableViewCellIdentifier, for: indexPath) as! HomeSingleCategoryTableViewCell
            
            
            let secondSingleCategoryView = cell4.viewWithTag(100) as? UICollectionView
            secondSingleCategoryView?.register(UINib.init(nibName: LHCellIdefntifiers.homeSingleCategoryCollectionViewCellIdentifier, bundle: nil), forCellWithReuseIdentifier: LHCellIdefntifiers.homeSingleCategoryCollectionViewCellIdentifier)
            
            return cell4
            
        }
        else {
           let cell5 = homeTableView.dequeueReusableCell(withIdentifier: LHCellIdefntifiers.homeLolyhubOfferCategoryTableViewCellIdentifier, for: indexPath) as! HomeLolyhubOfferCategoryTableViewCell

            return cell5
            
        }
        
    }
    
    // MARK: - tableView will display cell
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if(indexPath.row == 1) {
            guard let HomeCategoryTableViewCell = cell as? HomeCategoryTableViewCell else { return }
            
            HomeCategoryTableViewCell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.row)
        }
        
        if(indexPath.row == 2 || indexPath.row == 3) {
            
            guard let HomeSingleCategoryTableViewCell = cell as? HomeSingleCategoryTableViewCell else { return }
            
            HomeSingleCategoryTableViewCell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.row)
        }

        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.row == 0) {
            return 310
        }
        else if(indexPath.row == 1) {
            return 160
        }
        else if(indexPath.row == 2 || indexPath.row == 3) {
            return 385
        }
        else if(indexPath.row == 4) {
            return 480
        }
        else {
            return 153
        }
    }

    
    
    // MARK: - banner carousel delegate and dataSource
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


    // MARK: - collectionView extension implementation
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
            
            if(collectionView.tag == 1) {
                
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LHCellIdefntifiers.HomeCategoryCollectionViewCellIdentifier, for: indexPath) as! HomeCategoryCollectionViewCell
                
                cell.homeCategoryCollectionImageView.image = UIImage(named: LolyHubStyler.categoryElectronicsSampleImageName)
                
                return cell

            }
            else if(collectionView.tag == 2){
                
                let firstHomeSingleCategoryCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: LHCellIdefntifiers.homeSingleCategoryCollectionViewCellIdentifier, for: indexPath) as! HomeSingleCategoryCollectionViewCell
                
                return firstHomeSingleCategoryCollectionViewCell
                
                
            }
            else {
                let secondHomeSingleCategoryCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: LHCellIdefntifiers.homeSingleCategoryCollectionViewCellIdentifier, for: indexPath) as! HomeSingleCategoryCollectionViewCell
                
                return secondHomeSingleCategoryCollectionViewCell
            }
            
        }
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            print("Collection view at row \(collectionView.tag) selected index path \(indexPath)")
        }
    }




