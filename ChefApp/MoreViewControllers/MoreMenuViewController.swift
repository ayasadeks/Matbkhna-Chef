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
    @IBOutlet weak var menuTableView: UITableView!
    @IBOutlet weak var kitchenProfileView: CircleImageView!
    
    var images = ["Notification", "Settings", "wallet", "history", "Help", "About"]
    var names = ["Notifications", "Settings", "My wallet", "History", "Help center", "About us"]
    var segueIdentifiers = ["goNotifications", "goSettings","goWallet", "goHistory" ,"" , "goAbout"]
    
    var passData = ResturantDetailes()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuTableView.delegate = self
        menuTableView.dataSource = self
        
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
    
}



extension MoreMenuViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MenuTableViewCell
        cell.nameLabel.text = names[indexPath.row]
        cell.imageOfCell.image = UIImage(named: images[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: segueIdentifiers[indexPath.row], sender: self)
        
    }
    
}
