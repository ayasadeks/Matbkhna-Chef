//
//  CodeTextFeild.swift
//  ChefApp
//
//  Created by Admin on 9/21/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class TextFeildRadious: UITextField {
    @IBInspectable var cornerRadious : CGFloat = 0 {
        didSet{
            layer.cornerRadius = cornerRadious
            self.layer.masksToBounds = false
            self.clipsToBounds = true
            
        }
    }
    @IBInspectable var borderColor : UIColor = UIColor.black   {
        didSet{
            self.layer.masksToBounds = false
            self.layer.borderWidth = 1.0
            self.layer.borderColor = borderColor.cgColor
            self.clipsToBounds = true
        }
    }
    
}
