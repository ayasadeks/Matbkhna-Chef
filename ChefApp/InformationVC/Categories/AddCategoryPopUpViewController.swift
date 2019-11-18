//
//  AddCategoryPopUpViewController.swift
//  ChefApp
//
//  Created by Admin on 9/24/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class AddCategoryPopUpViewController: UIViewController {
   

    @IBOutlet weak var tableView: UITableView!
    
    var categoryArray = [CategoryData]()
    var delegate : sentCategoryId?
    var categoryId = Int()
    var current_page = 1
    var last_page = 1
    var isLoading : Bool = false
    
    var categoryNamee: String?
    
    
    
    lazy var refresher: UIRefreshControl = {
        let refresher = UIRefreshControl()
        refresher.addTarget(self, action: #selector(HandelRefresh), for: .valueChanged)
        return refresher
    }()
//    func setCategoryIdFunc(categoryID: Int) {
//        categoryId = categoryID
//        print("categryIdd\(categoryId)")
//        self.isLoading = false
//        viewDidLoad()
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        tableView.separatorInset = .zero
        tableView.contentInset = .zero
        tableView.addSubview(refresher)
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.allowsMultipleSelection = true
        self.tableView.allowsMultipleSelectionDuringEditing = true
        HandelRefresh()

    }
    
    @IBAction func closeButton(_ sender: Any) {
        print("close")
            //go to next view controller
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "goInformation") as! KitchenInformationViewController
            self.present(nextViewController, animated: false, completion: nil)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        self.tabBarController?.tabBar.isHidden = true
        if let index = self.tableView.indexPathForSelectedRow{
            self.tableView.deselectRow(at: index, animated: true)
        }
    }
    
    @IBAction func savecontinueButton(_ sender: Any) {
        if let selectedRows = tableView.indexPathsForSelectedRows {
            // 1
            var items = [Int]()
            for indexPath in selectedRows  {
                items.append(categoryArray[indexPath.row].id!)
            }
            // 2
            API.SetCategory(categories: items) { (sucess) in
                if sucess!{
                    print("hiiiii")
                    self.showToast(message: "Caetgory Added Sucessufly".localize)
                    let nextVC =  self.storyboard!.instantiateViewController(withIdentifier: "goInformation") as! KitchenInformationViewController
                    
                    self.navigationController?.pushViewController(nextVC, animated: true)
                }else{
                    self.showAlert(title: "Error".localize, messages: nil, message: "There Is No Internet Connection".localize , selfDismissing: false)
                }
            }
            for item in items {
                print("item = \(item)")
                
            }
            
        }else{
            self.showAlert(title: "Error".localize, messages: nil, message: "Please Choose Your Category".localize , selfDismissing: false)
        }

}

    
    @IBAction func categoryActionsBtns(_ sender: UIButton ) {
//        if sender.tag == 0 {
//            firstImage.image = UIImage(named: "success_active")
//            secondImage.image = UIImage(named: "success")
//            thirdImage.image = UIImage(named: "success")
//            print("first btn")
//
//        }else if sender.tag == 1  {
//            secondImage.image = UIImage(named: "success_active")
//            firstImage.image = UIImage(named: "success")
//            thirdImage.image = UIImage(named: "success")
//            print("second btn")
//
//
//        }else if sender.tag == 2 {
//            thirdImage.image = UIImage(named: "success_active")
//            firstImage.image = UIImage(named: "success")
//            secondImage.image = UIImage(named: "success")
//            print("third btn")
//        }
    }
    
    
}


extension AddCategoryPopUpViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray.count
    }//end of numberOfRowsInSection

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CategoryTableViewCell
        
        if self.getCurrentDeviceLanguage() == "ar"{
            cell.categoryName.text = categoryArray[indexPath.row].title
        }else if self.getCurrentDeviceLanguage() == "en"{
            cell.categoryName.text = categoryArray[indexPath.row].titleEng
        }
        
        return cell
      }//end of cellForRowAt

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return 60

    }//end of heightForRowAt
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let categoryResult = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "goInformation") as? KitchenInformationViewController
        categoryId = categoryArray[indexPath.row].id!
        if delegate != nil{
            delegate?.setCategoryIdFunc(categoryID: categoryId)
        }
        categoryResult?.categoryId = categoryArray[indexPath.row].id!
        self.navigationController?.pushViewController(categoryResult!, animated: true)
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cellToDeSelect:UITableViewCell = tableView.cellForRow(at: indexPath)!
        cellToDeSelect.contentView.backgroundColor = UIColor.white
        
        print("selected cell")
        
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let count = self.categoryArray.count
        if indexPath.row == count-1 {
            print("loadmore")
            LoadMore()
        }
    }

}//end of extension



