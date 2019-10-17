//
//  ImageCornerRadious.swift
//  ChefApp
//
//  Created by Admin on 9/21/19.
//  Copyright © 2019 Admin. All rights reserved.

import UIKit

class ImageCornerRadious: UIImageView {
    @IBInspectable var cornerRadious : CGFloat = 0 {
        didSet{
            layer.cornerRadius = cornerRadious
            self.layer.masksToBounds = false
            
            //     self.layer.shadowColor = UIColor.darkGray.cgColor
            self.layer.shadowOffset = CGSize(width: 0.0, height: 0.2)
            self.layer.shadowOpacity = 0.2
            self.clipsToBounds = true
            
            
        }
    }
    
    @IBInspectable var borderColor : UIColor = UIColor.black   {
        didSet{
            self.layer.masksToBounds = false
            self.layer.borderWidth = 0.5
            self.layer.borderColor = borderColor.cgColor
            self.clipsToBounds = true
        }
    }
    
}
