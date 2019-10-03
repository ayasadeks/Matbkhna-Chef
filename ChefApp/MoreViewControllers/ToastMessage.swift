//
//  ToastMessage.swift
//  DalelMoshia
//
//  Created by apple on 6/29/19.
//  Copyright © 2019 panorama. All rights reserved.
//

import UIKit
extension UIViewController{
    // msg like Waiting
    func showToast(message : String ) {
        
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2-150 , y: self.view.frame.size.height-100, width: 300, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Cairo-Regular", size: 17.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}