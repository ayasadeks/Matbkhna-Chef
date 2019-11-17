//
//  SelectAreaTableViewCell.swift
//  ChefApp
//
//  Created by Admin on 10/10/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class SelectAreaTableViewCell: UITableViewCell {

    @IBOutlet weak var cityLabel: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        //backgroundColor = selected ? .red : .clear
       // cityLabel.textColor = selected ? .white : .black
        // Configure the view for the selected state
    }

}
