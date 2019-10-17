//
//  RADishesCVC.swift
//  ChefApp
//
//  Created by Admin on 9/29/19.
//  Copyright © 2019 Admin. All rights reserved.
//


import UIKit

class RADishesCVC: UICollectionViewCell {
    //dishesCVC
    @IBOutlet weak var dishImage: CircleImageView!
    @IBOutlet weak var dishPrice: UILabel!
    @IBOutlet weak var dishDescription: UILabel!
    @IBOutlet weak var dishName: UILabel!
    @IBOutlet weak var shadowView: ViewCornerRadious!
    
    func configure(item: [DishDataArray], index: IndexPath , imageUrl : String) {
            //product name
            dishName.text = item[index.row].title!
            dishDescription.text = item[index.row].description!
            dishPrice.text = "\(item[index.row].smallPrice!)"
    
            //product image
        let url = imageUrl + "/\(item[index.row].photos![0].url!)"
            dishImage.kf.indicatorType = .activity
            dishImage.kf.setImage(with: URL(string: url))
    }

    
}
