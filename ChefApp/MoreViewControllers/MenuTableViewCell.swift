//
//  MenuTableViewCell.swift
//  ChefApp
//
//  Created by Admin on 9/20/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var view: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var goButton: UIButton!
    
    @IBOutlet weak var imageOfCell: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        view.layer.applySketchShadow(color: .black, alpha: 0.14, x: 0, y: 5, blur: 20, spread: 0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
