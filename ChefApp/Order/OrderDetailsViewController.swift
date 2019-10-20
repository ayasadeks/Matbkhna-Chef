//
//  OrderDetailsViewController.swift
//  ChefApp
//
//  Created by Admin on 10/20/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class OrderDetailsViewController: UIViewController {

    @IBOutlet weak var orderName: UILabel!
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var foodPriceLabel: UILabel!
    
    @IBOutlet weak var foodDetailsLabel: UILabel!
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var deliveryPriceLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
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
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
    
}

