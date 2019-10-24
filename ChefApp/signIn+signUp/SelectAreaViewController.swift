//
//  SelectAreaPopUpViewController.swift
//  ChefApp
//
//  Created by Admin on 9/25/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class SelectAreaViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchTextFeild: leftImage_cornerRadious!
  
    var delegate : sendCountryId?
    var countryArray = [AreaArrayData]()
    var searchKey = String()
    var current_page = 1
    var last_page = 1
    var LoadType = true
    var isLoading : Bool = false
    var keyFlag = String()
    var countryId = Int()
    var countryName = String()
    
    
    //to make table view refresh
    lazy var refresher: UIRefreshControl = {
        let refresher = UIRefreshControl()
        refresher.addTarget(self, action: #selector(HandelRefresh), for: .valueChanged)
        return refresher
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        //to delete extra cells in table view
        self.searchTextFeild.placeholder = "Search".localize
        self.tableView.allowsMultipleSelection = true
        self.tableView.allowsMultipleSelectionDuringEditing = true
        tableView.tableFooterView = UIView()
        tableView.separatorInset = .zero
        tableView.contentInset = .zero
        tableView.addSubview(refresher)
        keyFlag = "country"
        searchTextFeild.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        HandelRefresh()
        if let index = self.tableView.indexPathForSelectedRow{
            self.tableView.deselectRow(at: index, animated: true)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.tabBarController?.tabBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.tabBarController?.tabBar.isHidden = false
    }
  
    
    @IBAction func saveAndNextBtn(_ sender: UIButton) {
        let homeVC =  self.storyboard!.instantiateViewController(withIdentifier: "goSIgnUp") as! SignUpViewController
        if countryId == 0 {
            self.showAlert(title: "Error".localize, messages: nil, message: "Please Choose country at first".localize, selfDismissing: false)
        }else{
            homeVC.countryName = self.countryName
            homeVC.countryId = self.countryId
            self.navigationController?.pushViewController(homeVC, animated: true)
            
        }


    }
    
    
}



// search area tableView Cell
extension SelectAreaViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryArray.count
    }//end of numberOfRowsInSection
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell" , for: indexPath) as! SelectAreaTableViewCell

        if self.getCurrentDeviceLanguage() == "ar" {
            cell.cityLabel.text = countryArray[indexPath.row].title

        }else if self.getCurrentDeviceLanguage() == "en"{
            cell.cityLabel.text = countryArray[indexPath.row].titleEng
        }
        
        return cell
    }//end of cellForRowAt
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 50
        
    }//end of heightForRowAt
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
////
//        let searchResult = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "goSIgnUp") as! SignUpViewController
//        countryId = countryArray[indexPath.row].id!
//        if delegate != nil{
//            delegate?.sendCountryId_Name(CountryId: countryArray[indexPath.row].id!, CountryName: countryArray[indexPath.row].title!)
//        }
//        searchResult.countryryId = countryArray[indexPath.row].id!
//        self.navigationController?.popViewController(animated: true)
//           ///////////////////////////
       
        if self.getCurrentDeviceLanguage() == "ar" {
            delegate?.sendCountryId_Name(CountryId: self.countryArray[indexPath.row].id!, CountryName: self.countryArray[indexPath.row].title!)
            
        }else if self.getCurrentDeviceLanguage() == "en"{
            delegate?.sendCountryId_Name(CountryId: self.countryArray[indexPath.row].id!, CountryName: self.countryArray[indexPath.row].titleEng!)
        }
        self.navigationController?.popViewController(animated: true)
        
        
        
        
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        let cellToDeSelect:UITableViewCell = tableView.cellForRow(at: indexPath)!
//        cellToDeSelect.contentView.backgroundColor = UIColor.white
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let count = self.countryArray.count
        if indexPath.row == count-1 {
            LoadMore()
        }

        
     
//        let count = self.countryArray.count
//
//        if indexPath.row == count-1 {
//            if LoadType == true{
//                loadMore()
//                print("loadmore")
//
//            }else{
//                SearchLoadMore()
//                print("searchloadmore")
//
//            }
//        }
        
        
  }
}//end of extension


extension SelectAreaViewController : UITextFieldDelegate{
//    @objc func textFieldDidChange(_ textField: UITextField) {
//        if textField.text!.count == 0{
//            keyFlag = "country"
//            handelRefresh()
//        }else{
//            keyFlag = "countryKey"
//            searchKey = textField.text!
//            print("textField \(searchKey)")
//            handelRefresh()
//        }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
        searchTextFeild.resignFirstResponder()
        return true
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if textField.text!.count == 0{
            HandelRefresh()
        }else{
            searchKey = textField.text!
            print("textField \(searchKey)")
        }
    }
}
