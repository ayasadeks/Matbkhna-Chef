//
//  MoreMenuViewController.swift
//  ChefApp
//
//  Created by Admin on 9/20/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class MoreMenuViewController: UIViewController {

    @IBOutlet weak var nameOfChef: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var kitchenProfileView: CircleImageView!
    
    var passData = ResturantDetailes()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        passData.ReNameLabel == nameOfChef

        
    kitchenProfileView.dropShadow(color: .black, alpha: 0.12, x: 0, y: 5, blur: 6, spread: 0)
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(MoreMenuViewController.someAction(_:)))            
            self.profileView.addGestureRecognizer(gesture)

        let gesture2 = UITapGestureRecognizer(target: self, action: #selector(MoreMenuViewController.doAction(_:)))
        self.kitchenProfileView.addGestureRecognizer(gesture2)
    }
    
    // to go to next view controller programmtically
    @objc func someAction(_ sender:UITapGestureRecognizer){
        // do task
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "resturantDetailesVC") as! ResturantDetailes
        self.present(nextViewController, animated:false, completion:nil)
    }
    
    @objc func doAction(_ sender:UITapGestureRecognizer){
        // do task
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "resturantDetailesVC") as! ResturantDetailes
        self.present(nextViewController, animated:false, completion:nil)
    }
    
    @IBAction func notificationButton(_ sender: UIButton) {
        print("done")
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "notifications") as! NotificationsViewController
        self.present(nextViewController, animated:false, completion:nil)
    }
    
    @IBAction func settingsButton(_ sender: UIButton) {
        print("done")

        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "settings") as! SettingsViewController
        self.present(nextViewController, animated:false, completion:nil)
        
    }
    
    @IBAction func walletButton(_ sender: Any) {
        print("done")

        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "wallet") as! MyWalletViewController
        self.present(nextViewController, animated:false, completion:nil)
        
    }
    
    @IBAction func historyButton(_ sender: Any) {
        print("done")

        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "goHistory") as! HistoryViewController
        self.present(nextViewController, animated:false, completion:nil)
        
        
    }
    @IBAction func helpButton(_ sender: Any) {
    }
    @IBAction func aboutButton(_ sender: UIButton) {
        print("done")

        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "about") as! AboutViewController
        self.present(nextViewController, animated:false, completion:nil)
        
        
    }
    
    
    
}


