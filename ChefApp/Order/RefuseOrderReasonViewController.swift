//
//  RefuseOrderReasonViewController.swift
//  ChefApp
//
//  Created by Admin on 9/25/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class RefuseOrderReasonViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var sendOutlet: ButtonCornerRadious!
    override func viewDidLoad() {
        super.viewDidLoad()
sendOutlet.layer.applySketchShadow(color: .black, alpha: 0.06, x: 0, y: 5, blur: 4, spread: 0)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func sendButton(_ sender: Any) {
    }
    
    

}
