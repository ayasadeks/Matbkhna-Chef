//
//  VerficationAlertViewController.swift
//  ChefApp
//
//  Created by Admin on 9/24/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class VerficationAlertViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func doneButton(_ sender: Any) {
        
        //go to next view
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "goInformation") as! KitchenInformationViewController
        self.present(nextViewController, animated: false, completion: nil)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
