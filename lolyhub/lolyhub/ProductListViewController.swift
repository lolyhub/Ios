//
//  ProductListViewController.swift
//  lolyhub
//
//  Created by webwerks on 2/9/17.
//  Copyright © 2017 webwerks. All rights reserved.
//

import UIKit

class ProductListViewController: UIViewController , UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var productListParentView: UIView!
    @IBOutlet weak var productListLayoutButton: UIButton!
    var productListTableView: UITableView?
    var productListCollectionView : UICollectionView?
    @IBOutlet weak var productListFilterButton: UIButton!
    var productTableViewCell :ProductTableViewCell!
    var productCollectionViewCell : ProductCollectionViewCell!
    var isLayoutTable : Bool = true
    var isAddedToCart : Bool = false
    var isAddedToWishList : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        print("product list view")
        isLayoutTable = true
        // Do any additional setup after loading the view.
    }

    func setupView() {
        
        
        
        self.productListTableView = UITableView(frame: productListParentView.bounds, style: UITableViewStyle.plain)
        self.productListTableView?.delegate = self
        self.productListTableView?.dataSource = self
        self.productListParentView.addSubview(self.productListTableView!)
        
        let productCollectionLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        productCollectionLayout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 0, right: 1)
        productCollectionLayout.itemSize = CGSize(width: 180, height: 310)
        
        self.productListCollectionView = UICollectionView(frame: productListParentView.bounds, collectionViewLayout: productCollectionLayout)
        self.productListCollectionView?.delegate = self
        self.productListCollectionView?.dataSource = self
        self.productListCollectionView?.backgroundColor = UIColor.white
     //   self.productListParentView.addSubview(self.productListCollectionView!)
        
        self.productListCollectionView?.register(UINib.init(nibName: LHCellIdefntifiers.productCollectionCellIdentifier, bundle: nil), forCellWithReuseIdentifier: LHCellIdefntifiers.productCollectionCellIdentifier)
        
        self.productListTableView?.register(UINib.init(nibName: LHCellIdefntifiers.productTableViewCellIdentifier, bundle: nil), forCellReuseIdentifier: LHCellIdefntifiers.productTableViewCellIdentifier)
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 8
        
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        self.productTableViewCell = self.productListTableView?.dequeueReusableCell(withIdentifier: LHCellIdefntifiers.productTableViewCellIdentifier, for: indexPath) as! ProductTableViewCell
        
        // Configure the cell...
 
        self.productTableViewCell.cartButton.addTarget(self, action: #selector(self.addToCartButtonClicked(sender:)), for: .touchUpInside)
        self.productTableViewCell.cartButton.tag = indexPath.row
        
        self.productTableViewCell.wishButton.addTarget(self, action: #selector(self.addToWishListButtonClicked(sender:)), for: .touchUpInside)
        self.productTableViewCell.wishButton.tag = indexPath.row
        
        
        return self.productTableViewCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        self.productCollectionViewCell = self.productListCollectionView?.dequeueReusableCell(withReuseIdentifier: LHCellIdefntifiers.productCollectionCellIdentifier, for: indexPath) as! ProductCollectionViewCell
        
       // self.productCollectionViewCell.backgroundColor = UIColor.orange
        return self.productCollectionViewCell
        
    }
    
    
    @IBAction func productListLayoutButtonClicked(_ sender: Any) {
        
        
        var fromView: UIView?
        var toView: UIView?
        
        
        if(isLayoutTable) {
            self.productListLayoutButton.setImage(UIImage.init(named:LolyHubStyler.productListCollectionIconImageName ), for: UIControlState.normal)
            isLayoutTable = false
            
            fromView = self.productListTableView
            toView = self.productListCollectionView
            
            fromView?.removeFromSuperview()
            toView?.frame = self.view.bounds
            
           // self.productListParentView.addSubview(toView!)
            
            //  Converted with Swiftify v1.0.6242 - https://objectivec2swift.com/
           // UIView.transition(from: fromView!, to: toView!, duration: 0.25, options: .flipFromRight, completion: { _ in })
            
  
            
//            UIView.transition(from: fromView!, to: toView!, duration: 2, options: .transitionFlipFromBottom, completion: { (_) in
//                self.productListParentView.addSubview(toView!)
//            })
            
            UIView.transition(with: self.productListParentView, duration: 0.5, options: .transitionFlipFromBottom,
                                      animations: {self.productListParentView.addSubview(toView!)}, completion: nil)
            

            
        }
        else {
            self.productListLayoutButton.setImage(UIImage.init(named: LolyHubStyler.productListTableIconImageName), for: UIControlState.normal)
            isLayoutTable = true
            
            toView = self.productListTableView
            fromView = self.productListCollectionView
            
            fromView?.removeFromSuperview()
            toView?.frame = self.view.bounds
            
//            self.productListParentView.addSubview(toView!)
            
            UIView.transition(with: self.productListParentView, duration: 0.5, options: .transitionFlipFromBottom,
                              animations: {self.productListParentView.addSubview(toView!)}, completion: nil)
        }
    }
    
    @IBAction func productListFilterButtonClicked(_ sender: Any) {
        print("filter button clicked")
    }
    
    func addToCartButtonClicked(sender :UIButton) {
        
        /*
        let point = self.productListTableView.convert(CGPoint.zero, from: sender)
        
        if let indexP = self.productListTableView.indexPathForRow(at: point) {
            // Do something with indexPath
            self.productTableViewCell = self.productListTableView.dequeueReusableCell(withIdentifier: LHCellIdefntifiers.productTableViewCellIdentifier, for:indexP ) as! ProductTableViewCell
            if(isAddedToCart) {
                
                self.productTableViewCell.cartButton.setImage(UIImage(named:LolyHubStyler.cartNotSelectedIconImageName), for: .normal)
                isAddedToCart = false
            }
            else {
                //cell.cartButton.setImage(UIImage.init(named: LolyHubStyler.cartSelectedIconImageName), for: .normal)
                isAddedToCart = true
                
                self.productTableViewCell.cartButton.setImage(UIImage(named:LolyHubStyler.cartSelectedIconImageName), for: .normal)
                
            }
        }
        */
        
        print("added to cart: product at indexPath.row = \(sender.tag)")
        
    }
    
    func addToWishListButtonClicked(sender :UIButton) {
        print("added to wishList: product at indexPath.row = \(sender.tag)" )
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
