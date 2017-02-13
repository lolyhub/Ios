//
//  ProductListViewController.swift
//  lolyhub
//
//  Created by webwerks on 2/9/17.
//  Copyright © 2017 webwerks. All rights reserved.
//

import UIKit

class ProductListViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var productListLayoutButton: UIButton!
    @IBOutlet weak var productListTableView: UITableView!
    @IBOutlet weak var productListFilterButton: UIButton!
    var productTableViewCell :ProductTableViewCell!
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
        
        self.productListTableView.register(UINib.init(nibName: LHCellIdefntifiers.productTableViewCellIdentifier, bundle: nil), forCellReuseIdentifier: LHCellIdefntifiers.productTableViewCellIdentifier)
        
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
        return 4
        
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        self.productTableViewCell = self.productListTableView.dequeueReusableCell(withIdentifier: LHCellIdefntifiers.productTableViewCellIdentifier, for: indexPath) as! ProductTableViewCell
        
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
    
    @IBAction func productListLayoutButtonClicked(_ sender: Any) {
        if(isLayoutTable) {
            self.productListLayoutButton.setImage(UIImage.init(named:LolyHubStyler.productListCollectionIconImageName ), for: UIControlState.normal)
            isLayoutTable = false
        }
        else {
            self.productListLayoutButton.setImage(UIImage.init(named: LolyHubStyler.productListTableIconImageName), for: UIControlState.normal)
            isLayoutTable = true
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
