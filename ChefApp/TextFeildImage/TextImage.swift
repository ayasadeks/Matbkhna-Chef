//
//  TextImage.swift
//  DalelMoshia
//
//  Created by apple on 6/29/19.
//  Copyright © 2019 panorama. All rights reserved.
//

import UIKit
class leftImage_cornerRadious: UITextField {
    
    @IBInspectable var leftImage : UIImage? {
        didSet{
            updateView()
        }
    }
    @IBInspectable var leftPadding : CGFloat = 0 {
        didSet{
            updateView()
        }
    }
    
    func updateView(){
        if let image = leftImage{
            leftViewMode = .always
            let imageView = UIImageView(frame: CGRect(x:leftPadding , y:2 , width:18, height:18))
            imageView.image = image
            imageView.tintColor = tintColor
            var width = leftPadding + 30
            if borderStyle == UITextField.BorderStyle.none || borderStyle == UITextField.BorderStyle.line{
                width = width + 10
            }
            let view = UIView(frame: CGRect(x:0 , y:0 , width:width ,height:25))
            view.addSubview(imageView)
            leftView = view
        }else{
            leftViewMode = .never
        }
    }
    
    @IBInspectable var cornerRadious : CGFloat = 0 {
        didSet{
            self.layer.masksToBounds = false
            
            self.layer.borderColor = UIColor(red: 234 / 255.0, green: 236 / 255.0, blue: 239 / 255.0, alpha: 0).cgColor
            self.layer.borderWidth = 1.0
            self.layer.cornerRadius = cornerRadious
            self.clipsToBounds = true
        }
    }//end of cornerRadious
    
}
