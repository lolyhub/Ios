//
//  ProductDetailViewController.swift
//  lolyhub
//
//  Created by webwerks on 2/9/17.
//  Copyright © 2017 webwerks. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController, iCarouselDelegate, iCarouselDataSource {

    
    @IBOutlet weak var carouselView: iCarousel!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var items: [Int] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControl.numberOfPages = 5
        pageControl.currentPage = 0
        carouselView.type = .linear
        
        print("detail page screen")
        // Do any additional setup after loading the view.
    }

    func numberOfItems(in carousel: iCarousel) -> Int {
        return 5
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
            itemView = UIImageView(frame: carouselView.bounds)
            itemView.contentMode = UIViewContentMode.scaleAspectFit
            itemView.image = UIImage(named: "detailWatchSample")
        }
        
        return itemView
    }
    
    func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        if (option == .spacing) {
            return value * 1.1
        }
        return value
    }
    
    func carouselCurrentItemIndexDidChange(_ carousel: iCarousel) {
        pageControl.currentPage = carousel.currentItemIndex
    }
    
    
    @IBAction func pageControlValueChanged(_ sender: UIPageControl) {
        carouselView.scrollToItem(at: sender.currentPage, animated: true)
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
