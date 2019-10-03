//
//  RAReviewsCVC.swift
//  Mtbakhna
//
//  Created by Rania on 9/14/19.
//  Copyright © 2019 Rania. All rights reserved.
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
