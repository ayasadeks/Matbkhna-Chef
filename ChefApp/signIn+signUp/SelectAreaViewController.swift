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
    //use protocol&delegate (to pass data from city to location view controller... to pass data from C -> A we pass it from C -> B then from B -> c)
    var countryName : String?
    var delegate : setCityAndCountryNameDelegate?
    var cityName : String?
    var countryId : Int?
    //pagination variables i used
    var countryArray = [AreaArrayData]()
    var searchKey = String()
    var current_page = 1
    var last_page = 1
    var isLoading : Bool = false
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
        keyFlag = "city"
        searchTextFeild.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        HandelRefresh()
    }

    
}


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
        
        return 80
        
    }//end of heightForRowAt
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.getCurrentDeviceLanguage() == "ar" {
            cityName = countryArray[indexPath.row].title
            
        }else if self.getCurrentDeviceLanguage() == "en"{
            cityName = countryArray[indexPath.row].titleEng
        }
        if delegate != nil{
            delegate?.setCityAndCountryNameFunc(cityName: cityName! , countryName: self.countryName!, locationID: countryId!)
            //print("countryId\(countryId)")
        }
        navigationController?.popToRootViewController(animated: true)
        
        
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cellToDeSelect:UITableViewCell = tableView.cellForRow(at: indexPath)!
        cellToDeSelect.contentView.backgroundColor = UIColor.white
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
