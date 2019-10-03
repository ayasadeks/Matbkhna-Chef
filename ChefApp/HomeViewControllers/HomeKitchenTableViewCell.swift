//
//  HomeKitchenTableViewCell.swift
//  ChefApp
//
//  Created by Admin on 9/19/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit
import SwipeCellKit

class HomeKitchenTableViewCell: SwipeTableViewCell {

    @IBOutlet weak var viewOfCell: UIView!
 
    @IBOutlet weak var imageOfFood: UIImageView!
    @IBOutlet weak var nameOfFood: UILabel!
    @IBOutlet weak var priceOfFood: UILabel!
    @IBOutlet weak var descriptionOfFood: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
  
//    
//    func configure(item: [DishDataArray], index: IndexPath, imageUrl : String) {
//        //product name
//        nameOfFood.text = item[index.row].title
//        descriptionOfFood.text = item[index.row].description
//        priceOfFood.text = "\(item[index.row].smallPrice)"
//
//        //product image
//        let url = imageUrl + "/\(item[index.row].photos![0].url!)"
//        imageOfFood.kf.indicatorType = .activity
//        imageOfFood.kf.setImage(with: URL(string: url))
//    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func editButton(_ sender: Any) {
//        //go to next view controller
//        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "goMenu") as! MenuViewController
//        self.present(nextViewController, animated: true, completion: nil)
    }
    
}
