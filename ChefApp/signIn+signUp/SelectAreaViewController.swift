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
  
    var delegat : sendCountryId?
    var countryArray = [AreaArrayData]()
    var searchKey = String()
    var current_page = 1
    var last_page = 1
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
        self.title = "Choose City".localize
        self.searchTextFeild.placeholder = "Search".localize
        tableView.tableFooterView = UIView()
        tableView.separatorInset = .zero
        tableView.contentInset = .zero
        tableView.addSubview(refresher)
        keyFlag = "country"
        searchTextFeild.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        HandelRefresh()
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
    func sendCountryId_Name(CountryId: Int, CountryName: String) {
        countryId = CountryId
        countryName = CountryName
        searchTextFeild.text = CountryName
    }
    
}



// search area tableView Cell
extension SelectAreaViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print("countryArray.count\(countryArray.count)")
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
        if self.getCurrentDeviceLanguage() == "ar" {
            delegat?.sendCountryId_Name(CountryId: self.countryArray[indexPath.row].id!, CountryName: self.countryArray[indexPath.row].title!)
            
        }else if self.getCurrentDeviceLanguage() == "en"{
            delegat?.sendCountryId_Name(CountryId: self.countryArray[indexPath.row].id!, CountryName: self.countryArray[indexPath.row].titleEng!)
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
    }
    
}//end of extension


extension SelectAreaViewController : UITextFieldDelegate{
    @objc func textFieldDidChange(_ textField: UITextField) {
        if textField.text!.count == 0{
            keyFlag = "country"
            HandelRefresh()
        }else{
            keyFlag = "countryKey"
            searchKey = textField.text!
            print("textField \(searchKey)")
            HandelRefresh()
        }
}
}
