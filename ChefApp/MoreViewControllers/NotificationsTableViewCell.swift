//
//  NotificationsTableViewCell.swift
//  ChefApp
//
//  Created by Admin on 9/21/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class NotificationsTableViewCell: UITableViewCell {
    @IBOutlet weak var viewOfCell: ViewCornerRadious!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var orderNameLbl: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var pendingButton: ButtonCornerRadious!
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
    @IBAction func viewButton(_ sender: UIButton) {
    }
    
}
