//
//  ExtraItemsTableViewCell.swift
//  ChefApp
//
//  Created by Admin on 10/16/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class ExtraItemsTableViewCell: UITableViewCell {

    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var checkedImage: UIImageView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
//    func configure(item: [ExtraItemData], index: IndexPath ) {
//        //product name
//        itemName.text = item[index.row].title!
//        itemPrice.text = "\(item[index.row].titleEng!)"
//    }
    
    
    @IBAction func editButton(_ sender: UIButton) {
    }
    
    @IBAction func deleteButton(_ sender: UIButton) {
//
//        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "deleteItemPopUp") as! DeleteItemPopUpViewController
//        self.present(nextViewController, animated: false, completion: nil)
    }
}
