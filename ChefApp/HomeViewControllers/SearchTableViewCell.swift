//
//  SearchTableViewCell.swift
//  ChefApp
//
//  Created by Admin on 9/25/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit
import Cosmos

class SearchTableViewCell: UITableViewCell {

    @IBOutlet weak var kitchenImage: UIImageView!
    
    @IBOutlet weak var kitchenName: UILabel!
    @IBOutlet weak var kitchenRateView: CosmosView!
    @IBOutlet weak var viewOfCell: ViewCornerRadious!
    
    @IBOutlet weak var foodName: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewOfCell.dropShadow(color: .black, alpha: 0.14, x: 0, y: 5, blur: 20, spread: 0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
