//
//  ExtraItemsViewController.swift
//  ChefApp
//
//  Created by Admin on 10/16/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class ExtraItemsViewController: UIViewController {
    
    @IBOutlet weak var extraTableView: UITableView!    
    @IBOutlet weak var extraNameTxtField: UITextField!
    @IBOutlet weak var priceItemTxtField: UITextField!
    
    let api_token = UserDefaultData.get_user_string_data(key: "userToken")
    
    var extraItemArray = [ExtraItemData]()
    var current_page = 1
    var last_page = 1
    var isLoading : Bool = false
    var keyword = String()
    var cellVC = ExtraItemsTableViewCell()
    var extraItem : ExtraItemData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        extraTableView.tableFooterView = UIView()
        extraTableView.separatorInset = .zero
        extraTableView.contentInset = .zero
        extraTableView.addSubview(refresher)
        extraTableView.delegate = self
        extraTableView.dataSource = self
        self.extraTableView.allowsMultipleSelection = true
        self.extraTableView.allowsMultipleSelectionDuringEditing = true
        
        HandelRefresh()

    }
    //to make table view refresh
    lazy var refresher: UIRefreshControl = {
        let refresher = UIRefreshControl()
        refresher.addTarget(self, action: #selector(HandelRefresh), for: .valueChanged)
        return refresher
    }()
    
    
    @IBAction func AddButton(_ sender: UIButton) {
      guard let title = extraNameTxtField.text , !title.isEmpty,  let price = priceItemTxtField.text , !price.isEmpty else{
            self.showAlert(title: "Error".localize, messages: nil, message: "Please Enter All the empty fields".localize, selfDismissing: false)
            return
        }
        API.AddDishExtra(title: title, titleEng : price) { (sucess) in
            if sucess!{
               // print("extra item added sucessfully")
                self.showToast(message: "extra item added sucessfully")
                
                self.extraItemArray.append(self.extraItem!)

                self.extraTableView.beginUpdates()
                self.extraTableView.insertRows(at: [
                    NSIndexPath(row: self.extraItemArray.count-1, section: 0) as IndexPath], with: .automatic)
                self.extraTableView.endUpdates()
                
                self.extraNameTxtField.text = ""
                self.priceItemTxtField.text = ""
                self.extraTableView.reloadData()

            }else{
                self.showAlert(title: "Error".localize, messages: nil, message: "No Internet Connection".localize , selfDismissing: false)
            }
        }
    
    }
    

    @IBAction func saveButton(_ sender: UIButton) {
      
        
//        API.AddDishExtra(title: title!, titleEng : price!) { (sucess) in
//            if sucess!{
//                print("extra item added sucessfully")
//              //  self.LoadMore()
//              //  self.HandelRefresh()
//              //  self.extraTableView.reloadData()
//                self.showToast(message: "extra item added sucessfully")
//                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "addDish") as! AddDishesViewController
//                self.present(nextViewController, animated: false, completion: nil)
//
//            }else{
//                self.showAlert(title: "Error".localize, messages: nil, message: "No Internet Connection".localize , selfDismissing: false)
//            }
//        }
    }
    
    
    
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: false, completion: nil)
    }

}


extension ExtraItemsViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("extraItemArray.count\(extraItemArray.count)")
        return extraItemArray.count
    }
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ExtraItemsTableViewCell
        
        cell.itemName.text = extraItemArray[indexPath.row].title
        cell.itemPrice.text = extraItemArray[indexPath.row].smallPrice
     //   extraItemArray.append(extraNameTxtField!.text)
    
        
        return cell
        
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("Deleted")
            
            extraItemArray.remove(at: indexPath.row) //Remove element from your array
            self.extraTableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cellToDeSelect:ExtraItemsTableViewCell = tableView.cellForRow(at: indexPath)! as! ExtraItemsTableViewCell
        cellToDeSelect.contentView.backgroundColor = UIColor.white

        cellToDeSelect.checkedImage.image = UIImage(named: "success_active")

        print("selected cell")

    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let count = self.extraItemArray.count
        
        if indexPath.row == count-1 {
            LoadMore()
            print("loadmore")
            
        }
    }
}
