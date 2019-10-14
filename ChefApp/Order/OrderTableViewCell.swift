//
//  OrderTableViewCell.swift
//  ChefApp
//
//  Created by Admin on 9/24/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class OrderTableViewCell: UITableViewCell {

    @IBOutlet weak var viewOfCell: ViewCornerRadious!
    
    @IBOutlet weak var orderID: UILabel!
    
    @IBOutlet weak var orderName: UILabel!
 
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var statusOfOrder: UILabel!
    @IBOutlet weak var orderSubName: UILabel!
    @IBOutlet weak var timeLabel: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewOfCell.dropShadow(color: .black, alpha: 0.14, x: 0, y: 5, blur: 20, spread: 0)
        statusLabel.layer.cornerRadius = 8
        statusLabel.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
 
    @IBAction func viewOrderButton(_ sender: Any) {
     //   go to next view controller
//        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "orderDetails") as! DetailsViewController
//        self.present(nextViewController, animated: true, completion: nil)

        
//        let newViewController = DetailsViewController()
//        UINavigationController?.pushViewController(newViewController, animated: true)
//        
    }
    
}
