//
//  LoginSignupParentViewController.swift
//  lolyhub
//
//  Created by webwerks on 1/9/17.
//  Copyright © 2017 webwerks. All rights reserved.
//

import UIKit

class LoginSignupParentViewController: UIViewController {

    enum TabIndex : Int {
        case FirstChildTab = 0
        case SecondChildTab = 1
    }
    
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet weak var contentView: UIView!
    
    var currentViewController: UIViewController?
    lazy var firstChildTabVC: UIViewController? = {
        let firstChildTabVC = self.storyboard?.instantiateViewController(withIdentifier: LHViewControllers.SignUpViewController.rawValue)
        return firstChildTabVC
    }()
    lazy var secondChildTabVC : UIViewController? = {
        let secondChildTabVC = self.storyboard?.instantiateViewController(withIdentifier: LHViewControllers.LoginViewController.rawValue)
        return secondChildTabVC
    }()

    
    override func viewDidLoad() { 
        super.viewDidLoad()
        
        setupSegmentedControl()
        segmentedControl.selectedSegmentIndex = TabIndex.FirstChildTab.rawValue
        displayCurrentTab(tabIndex: TabIndex.FirstChildTab.rawValue)
    }
   
    func setupSegmentedControl() {
        self.segmentedControl.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.black], for: UIControlState.selected)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) { 
        super.viewWillDisappear(true)
        if let currentViewController = currentViewController {
            currentViewController.viewWillDisappear(animated)
        }
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
  
    @IBAction func switchTabs(_ sender: Any) {
        self.currentViewController!.view.removeFromSuperview()
        self.currentViewController!.removeFromParentViewController()
        
        displayCurrentTab(tabIndex: (sender as AnyObject).selectedSegmentIndex)
    }
    
    
    @IBAction func crossButtonClicked(_ sender: Any) {
        
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    
    func displayCurrentTab(tabIndex: Int){
        if let vc = viewControllerForSelectedSegmentIndex(index: tabIndex) {
            
            self.addChildViewController(vc)
            vc.didMove(toParentViewController: self)
            
            vc.view.frame = self.contentView.bounds
            self.contentView.addSubview(vc.view)
            self.currentViewController = vc
        }
    }
    
    func viewControllerForSelectedSegmentIndex(index: Int) -> UIViewController? {
        var vc: UIViewController?
        switch index {
        case TabIndex.FirstChildTab.rawValue :
            vc = firstChildTabVC
        case TabIndex.SecondChildTab.rawValue :
            vc = secondChildTabVC
        default:
            return nil
        }
        
        return vc
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
