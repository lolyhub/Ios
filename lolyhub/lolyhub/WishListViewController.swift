//
//  WishListViewController.swift
//  lolyhub
//
//  Created by webwerks on 1/12/17.
//  Copyright © 2017 webwerks. All rights reserved.
//

import UIKit

class WishListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var moveToCartButton: UIButton!
    
    @IBOutlet weak var wishListTableView: UITableView!

    @IBOutlet weak var sideMenuButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        addSideMenuFunctionality(to: sideMenuButton, on: self)
        addNavigationTitleImage(on: self)
        // Do any additional setup after loading the view.
    }
    
    func setupView() {
        self.wishListTableView.register(UINib.init(nibName: "CartWishListTableViewCell", bundle: nil), forCellReuseIdentifier: "CartWishListTableViewCell")
        self.moveToCartButton.layer.cornerRadius = 5
    }

    // MARK: - Tableview delegate and dataSource methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let wishListCell = self.wishListTableView.dequeueReusableCell(withIdentifier: "CartWishListTableViewCell", for: indexPath) as! CartWishListTableViewCell
        
        wishListCell.increaseCartButton.styleViewMoreButton()
        wishListCell.decreaseCartButton.styleViewMoreButton()
        wishListCell.cartQuantityLabel.layer.borderColor = LolyHubStyler.viewMoreButtonGreyBorderColor.cgColor
        wishListCell.cartQuantityLabel.layer.borderWidth = 1.0
        
        wishListCell.cartStatusButton.isHidden = false
        wishListCell.moveToCartLabel.isHidden = false
        
        return wishListCell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let deleteAction:UITableViewRowAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "  ", handler: { (tvra:UITableViewRowAction!, indexPath:IndexPath) -> Void in
            
            print("hellooo")
            
        })
        
        
        
        //Change background color
        deleteAction.backgroundColor = UIColor(red: 203/255, green: 76/255, blue: 76/255, alpha: 1)
        
        deleteAction.backgroundColor = UIColor(patternImage: UIImage(named: "cellDeleteImage")!)
        
        return [deleteAction]
    }

    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
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
