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
    var isLayoutTable : Bool = true
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
        let cell : ProductTableViewCell = self.productListTableView.dequeueReusableCell(withIdentifier: LHCellIdefntifiers.productTableViewCellIdentifier, for: indexPath) as! ProductTableViewCell
        
        // Configure the cell...
        
        //cell.descriptionLabel.text = "Hello"
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
    
    @IBAction func productListLayoutButtonClicked(_ sender: Any) {
        if(isLayoutTable) {
            self.productListLayoutButton.setImage(UIImage.init(named: "productListCollectionIcon"), for: UIControlState.normal)
            isLayoutTable = false
        }
        else {
            self.productListLayoutButton.setImage(UIImage.init(named: "productListTableIcon"), for: UIControlState.normal)
            isLayoutTable = true
        }
    }
    
    @IBAction func productListFilterButtonClicked(_ sender: Any) {
        print("filter button clicked")
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
