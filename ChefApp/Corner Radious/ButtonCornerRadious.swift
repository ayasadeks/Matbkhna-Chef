//
//  ButtonCornerRadious.swift
//  DalelMoshia
//
//  Created by apple on 6/29/19.
//  Copyright © 2019 panorama. All rights reserved.
//

import UIKit

class ButtonCornerRadious: UIButton {
    @IBInspectable var cornerRadious : CGFloat = 0 {
        didSet{
            layer.cornerRadius = cornerRadious
            self.layer.masksToBounds = false
//            self.layer.borderWidth = 0.1
          //  self.layer.shadowColor = UIColor.lightGray.cgColor
          //  self.layer.shadowOffset = CGSize(width: 0.0, height: 0.2)
           // self.layer.shadowOpacity = 0.2
            
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
    @IBInspectable var borderWidth : CGFloat = 0    {
        didSet{
            self.layer.masksToBounds = false
            self.layer.borderWidth = borderWidth
            self.clipsToBounds = true
        }
    }
}
