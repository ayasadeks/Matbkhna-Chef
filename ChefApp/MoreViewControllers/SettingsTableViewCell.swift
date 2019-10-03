//
//  SettingsTableViewCell.swift
//  ChefApp
//
//  Created by Admin on 9/21/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {

    @IBOutlet weak var goImage: UIImageView!
    @IBOutlet weak var viewOfCell: UIView!
    @IBOutlet weak var userInformationLabels: UILabel!
    @IBOutlet weak var line: UIView!
    
    @IBOutlet weak var appSettingsLabels: UILabel!
    @IBOutlet weak var line2: UIView!
    @IBOutlet weak var goImage2: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewOfCell.layer.applySketchShadow(color: .black, alpha: 0.14, x: 0, y: 5, blur: 20, spread: 0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
