//
//  HistoryViewController.swift
//  ChefApp
//
//  Created by Admin on 9/25/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {

    var orderName = ["C#120900 Chicken Rice Salad","C#120900 Chicken Rice Salad"]
    var secondLabel = ["Chicken World","Chicken World"]
    var thirdLabel = ["882 Swift Courts Apt. 918","882 Swift Courts Apt. 918"]
    var statusLbl = ["Status : Pending","Status : Pending"]
    var timeLbl = ["00:00","00:00"]
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }

}
extension HistoryViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HistoryTableViewCell
       // cell.label1.text = firstLabel[indexPath.row]
        cell.label2.text = secondLabel[indexPath.row]
        cell.label3.text = thirdLabel[indexPath.row]
        cell.label4.text = statusLbl[indexPath.row]
        cell.timeLabel.text = timeLbl[indexPath.row]
        cell.orderNameLabel.text = orderName[indexPath.row]
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 165
    }
    
}

