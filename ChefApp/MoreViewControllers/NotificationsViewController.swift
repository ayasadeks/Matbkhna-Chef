//
//  NotificationsViewController.swift
//  ChefApp
//
//  Created by Admin on 9/21/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class NotificationsViewController: UIViewController {

    var firstLabel = ["C#120900"]
    var orderName = ["Chicken Rice Salad"]
    var secondLabel = ["Chicken World"]
    var thirdLabel = ["882 Swift Courts Apt. 918"]
    var statusLbl = ["Status : Pending"]
    var timeLbl = ["00:00"]


    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        //go to next view controller
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "moreVC") as! MoreMenuViewController
        self.present(nextViewController, animated: false, completion: nil)


    }
    

}


extension NotificationsViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return firstLabel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NotificationsTableViewCell
        cell.label1.text = firstLabel[indexPath.row]
        cell.label2.text = secondLabel[indexPath.row]
        cell.label3.text = thirdLabel[indexPath.row]
        cell.label4.text = statusLbl[indexPath.row]
        cell.timeLabel.text = timeLbl[indexPath.row]
        cell.orderNameLbl.text = orderName[indexPath.row]


        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 149
    }
    
}
