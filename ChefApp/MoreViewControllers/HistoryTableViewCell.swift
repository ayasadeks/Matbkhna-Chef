//
//  HistoryTableViewCell.swift
//  ChefApp
//
//  Created by Admin on 9/25/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var viewOfCell: ViewCornerRadious!
    @IBOutlet weak var orderNameLabel: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var preparingButton: ButtonCornerRadious!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewOfCell.dropShadow(color: .black, alpha: 0.14, x: 0, y: 5, blur: 20, spread: 0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func viewDetailsButton(_ sender: Any) {
        //go to next view controller
//        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "goKitchenVC") as! HomeKitchenViewController
//        self.present(nextViewController, animated: true, completion: nil)
    }
    
}