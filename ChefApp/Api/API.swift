//
//  Api.swift
//  ChefApp
//
//  Created by Admin on 9/17/19.
//  Copyright © 2019 Admin. All rights reserved.
//


import UIKit
import Alamofire
import AlamofireImage
import CodableAlamofire
import SVProgressHUD
import MOLH
class API: NSObject {
    
    class func showSVProgress() {
        let svColor = #colorLiteral(red: 1, green: 0.8745098039, blue: 0, alpha: 1)
        SVProgressHUD.setForegroundColor(svColor)
        SVProgressHUD.setBorderColor(UIColor.clear)
        SVProgressHUD.show()
        SVProgressHUD.setDefaultMaskType(.clear)
    }//end of showSVProgress
    
    let langue = MOLHLanguage.currentAppleLanguage()
    class func dismissSVProgress() {
        SVProgressHUD.dismiss()
    }//end of dismissSVProgress
   
}//end of APi class

