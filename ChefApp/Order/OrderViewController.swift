//
//  OrderViewController.swift
//  ChefApp
//
//  Created by Admin on 9/24/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var orderArray = [OrderDataArray]()
    var current_page = 1
    var last_page = 1
    var isLoading : Bool = false
    var api_token = UserDefaultData.get_user_string_data(key: "userToken")
    var status = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        tableView.separatorInset = .zero
        tableView.contentInset = .zero
        tableView.addSubview(refresher)
        tableView.delegate = self
        tableView.dataSource = self
       LoadMore()
       HandelRefresh()
    }
   // to make table view refresh
    lazy var refresher: UIRefreshControl = {
        let refresher = UIRefreshControl()
        refresher.addTarget(self, action: #selector(HandelRefresh), for: .valueChanged)
        return refresher
    }()
    
}








extension OrderViewController : UITableViewDataSource, UITableViewDelegate{
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            print("orderArray.count  \(orderArray.count)")
            return orderArray.count
        }//end of numberOfRowsInSection
  
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! OrderTableViewCell
        cell.timeLabel.text = orderArray[indexPath.row].createdAt
        
        cell.statusLabel.text = orderArray[indexPath.row].status
//        if orderArray[indexPath.row].status == "2" {
//            cell.statusOfOrder.text = orderArray[indexPath.row].status
//        }
//        }else if cell.statusLabel.text == "3" {
//            cell.statusLabel.text = orderArray[indexPath.row].status
//            cell.statusOfOrder.text = orderArray[indexPath.row].status
//
//        }else if cell.statusLabel.text == "6" {
//            cell.statusLabel.text = orderArray[indexPath.row].status
//            cell.statusOfOrder.text = orderArray[indexPath.row].status
//        }

      
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
  
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if tableView == tableView{
            let count = self.orderArray.count
            if indexPath.row == count-1 {
                    LoadMore()
            print("loadmore")
            
        }
    }
}
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        let orderDetailsVC =  self.storyboard!.instantiateViewController(withIdentifier: "orderDetails") as! OrderDetailsViewController
        orderDetailsVC.orderName = (orderArray[indexPath.row].id) as! UILabel
      //  orderDetailsVC.status = orderArray[indexPath.row].status!
        orderDetailsVC.totalPriceLabel = orderArray[indexPath.row].totalPrice as! UILabel
       // orderDetailsVC.orderDate = orderArray[indexPath.row].createdAt!
       // orderDetailsVC.orderNumber = orderArray[indexPath.row].id!
        navigationController?.pushViewController(orderDetailsVC, animated: true)
    
    }
    
}
