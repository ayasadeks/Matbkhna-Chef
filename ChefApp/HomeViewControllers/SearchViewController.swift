//
//  SearchViewController.swift
//  ChefApp
//
//  Created by Admin on 9/25/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var images = ["default", "default"]
    var kitchenNames = ["pizza Kitchen", "pizza Kitchen"]
    var foodNames = ["Pizza - Chicken - Pasta", "Pizza - Chicken - Pasta"]
    
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    

    @IBAction func backButton(_ sender: Any) {
        
        dismiss(animated: false, completion: nil)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SearchTableViewCell
        
        cell.kitchenImage.image = UIImage(named: images[indexPath.row])
        cell.kitchenName.text = kitchenNames[indexPath.row]
        cell.foodName.text = foodNames[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

}
