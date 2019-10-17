//
//  RAReviewsCVC.swift
//  ChefApp
//
//  Created by Admin on 9/29/19.
//  Copyright © 2019 Admin. All rights reserved.
//


import UIKit
import Cosmos
class RAReviewsCVC: UICollectionViewCell {
  //reviewsCVC
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userImage: CircleImageView!
    
    @IBOutlet weak var userRate: CosmosView!
    @IBOutlet weak var userComment: UITextView!
}
