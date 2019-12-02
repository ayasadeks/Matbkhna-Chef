//
//  NotificationsViewController.swift
//  ChefApp
//
//  Created by Admin on 9/21/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class NotificationsViewController: UIViewController {

    var firstLabel = ["C#120900", "C#120900"]
    var orderName = ["Chicken Rice Salad", "Chicken Rice Salad"]
    var secondLabel = ["Chicken World", "Chicken World"]
    var thirdLabel = ["882 Swift Courts Apt. 918", "882 Swift Courts Apt. 918"]
    var statusLbl = ["Status : Pending","Status : Pending"]
    var timeLbl = ["00:00", "00:00"]


    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButton(_ sender: UIButton) {
     dismiss(animated: false, completion: nil)

    }
    

}


extension NotificationsViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return firstLabel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NotificationsTableViewCell
        cell.orderNameLbl.text = firstLabel[indexPath.row]
        cell.subNameLabel.text = secondLabel[indexPath.row]
       // cell.label3.text = thirdLabel[indexPath.row]
        cell.orderStatus.text = statusLbl[indexPath.row]
        cell.orderTimeLbl.text = timeLbl[indexPath.row]
        //cell.orderNameLbl.text = orderName[indexPath.row]


        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 185
    }
    
}
