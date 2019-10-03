//
//  DetailsViewController.swift
//  ChefApp
//
//  Created by Admin on 9/24/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var shadowView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
    
       shadowView.dropShadow(color: .black, alpha: 0.5, x: 0, y: 7, blur: 13, spread: 0)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func acceptstartButton(_ sender: Any) {
        let popvc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "popUp") as! AcceptPopUpViewController
        
        self.addChild(popvc)
        
        popvc.view.frame = self.view.frame
        
        self.view.addSubview(popvc.view)
        
        popvc.didMove(toParent: self)
      
    }
    

}
