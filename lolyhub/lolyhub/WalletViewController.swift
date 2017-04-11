//
//  WalletViewController.swift
//  lolyhub
//
//  Created by webwerks on 1/12/17.
//  Copyright © 2017 webwerks. All rights reserved.
//

import UIKit

class WalletViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var sideMenuButton: UIBarButtonItem!
    
    @IBOutlet weak var walletTableView: UITableView!
    
    @IBOutlet weak var addToProgramButton: UIButton!
    
    var selectedIndex = -2
    var arrayCount = 4
    
    var expandedRows = Set<Int>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        walletTableView.delegate = self
        setupView()
        addSideMenuFunctionality(to: sideMenuButton, on: self)
        addNavigationTitleImage(on: self)
        // Do any additional setup after loading the view.
    }

    func setupView() {
        self.walletTableView.register(UINib.init(nibName: "WalletTableViewCell", bundle: nil), forCellReuseIdentifier: "WalletTableViewCell")
        
       // self.walletTableView.rowHeight = UITableViewAutomaticDimension
        
        //self.moveToCartButton.layer.cornerRadius = 5
    }
    
    // MARK: - Tableview delegate and dataSource methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if selectedIndex >= 0 {
            return arrayCount+1
        }
        else{
            return arrayCount
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if  indexPath.row == selectedIndex+1 {
            let expandedCell = tableView.dequeueReusableCell(withIdentifier:
                "expanded", for: indexPath)
            return expandedCell
        }
        else{
            let walletCell = self.walletTableView.dequeueReusableCell(withIdentifier: "WalletTableViewCell", for: indexPath) as! WalletTableViewCell
            
            walletCell.isExpanded = self.expandedRows.contains(indexPath.row)
            
            
            
            //        wishListCell.increaseCartButton.styleViewMoreButton()
            //        wishListCell.decreaseCartButton.styleViewMoreButton()
            //        wishListCell.cartQuantityLabel.layer.borderColor = LolyHubStyler.viewMoreButtonGreyBorderColor.cgColor
            //        wishListCell.cartQuantityLabel.layer.borderWidth = 1.0
            //
            //        wishListCell.cartStatusButton.isHidden = false
            //        wishListCell.moveToCartLabel.isHidden = false
            //        
            return walletCell
        }
        
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row == selectedIndex{
            selectedIndex = -2
        }
        else{
            if selectedIndex >= 0{
                if indexPath.row > selectedIndex {
                 selectedIndex =  indexPath.row - 1
                }
                else{
                 selectedIndex =  indexPath.row
                }
                
            }
            else{
                 selectedIndex =  indexPath.row
            }
           
        }
        
        tableView.reloadData();
        //tableView.scrollToRow(at:indexPath , at: .top, animated: true)
    }
    
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        
//    }
    
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 270
//    }

    
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
