//
//  CartViewController.swift
//  lolyhub
//
//  Created by webwerks on 1/12/17.
//  Copyright © 2017 webwerks. All rights reserved.
//

import UIKit

class CartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var sideMenuButton: UIBarButtonItem!
    
    @IBOutlet weak var cartTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        addSideMenuFunctionality(to: sideMenuButton, on: self)
        addNavigationTitleImage(on: self)
        // Do any additional setup after loading the view.
    }
    
    // MARK: - setup methods
    func setupView() {
        self.cartTableView.register(UINib.init(nibName: "CartWishListTableViewCell", bundle: nil), forCellReuseIdentifier: "CartWishListTableViewCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Tableview delegate and dataSource methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cartCell = self.cartTableView.dequeueReusableCell(withIdentifier: "CartWishListTableViewCell", for: indexPath) as! CartWishListTableViewCell
        
        cartCell.increaseCartButton.styleViewMoreButton()
        cartCell.decreaseCartButton.styleViewMoreButton()
        cartCell.cartQuantityLabel.layer.borderColor = LolyHubStyler.viewMoreButtonGreyBorderColor.cgColor
        cartCell.cartQuantityLabel.layer.borderWidth = 1.0
        
        cartCell.cartStatusButton.isHidden = true
        cartCell.moveToCartLabel.isHidden = true
        
        return cartCell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
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
