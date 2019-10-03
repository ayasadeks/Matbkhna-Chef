//
//  ViewCornerRadios.swift
//  DalelMoshia
//
//  Created by apple on 6/29/19.
//  Copyright © 2019 panorama. All rights reserved.
//


import UIKit

class ViewCornerRadious: UIView {
    @IBInspectable var cornerRadious : CGFloat = 0 {
        didSet{
            layer.cornerRadius = cornerRadious
            self.layer.masksToBounds = false
                       self.layer.shadowColor = UIColor.darkGray.cgColor
                       self.layer.shadowOffset = CGSize(width: 0.0, height: 0.5)
                      self.layer.shadowOpacity = 0.5
            self.layer.borderWidth = 0.5
            self.layer.borderColor = UIColor.lightGray.cgColor
                      self.layer.shadowColor = UIColor(red:0.35, green:0.58, blue:0.5, alpha:0.52).cgColor
                     self.layer.shadowRadius = 5
            self.clipsToBounds = true
            
        }
    }
    @IBInspectable var borderColor : UIColor = UIColor.black   {
        didSet{
            self.layer.masksToBounds = false
            self.layer.borderWidth = 1
            self.layer.borderColor = borderColor.cgColor
            self.clipsToBounds = true

        }
    }

}
