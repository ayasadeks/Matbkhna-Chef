//
//  SelectAreaPopUpViewController.swift
//  ChefApp
//
//  Created by Admin on 9/25/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class SelectAreaViewController: UIViewController, sendCountryId {
   
    
    @IBOutlet weak var searchTextField: TextFeildRadious!
    @IBOutlet weak var tableView: UITableView!
    
  
    var delegate : sendCountryId?
    var countryArray = [AreaArrayData]()
    var searchKey = String()
    var current_page = 1
    var last_page = 1
    var LoadType = true
    var isLoading : Bool = false
    var keyFlag = String()
    var countryId = Int()
    var countryName : String?
   // var areaField = SignUpViewController()
    
    
    lazy var refresher: UIRefreshControl = {
        let refresher = UIRefreshControl()
        if LoadType == true{
            refresher.addTarget(self, action: #selector(handelRefresh), for: .valueChanged)
        }else{
            refresher.addTarget(self, action: #selector(searchHandelRefresh), for: .valueChanged)
        }
        return refresher
    }()

    func sendCountryId_Name(CountryId: Int, CountryName: String) {
        countryId = CountryId
        countryName = CountryName
        searchTextField.text = "\(CountryName)"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //to delete extra cells in table view
        self.searchTextField.placeholder = "Search".localize
        self.tableView.allowsMultipleSelection = true
        self.tableView.allowsMultipleSelectionDuringEditing = true
        tableView.tableFooterView = UIView()
        tableView.separatorInset = .zero
        tableView.contentInset = .zero
        tableView.addSubview(refresher)
        tableView.delegate = self
        tableView.dataSource = self
        keyFlag = "country"
        searchTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        handelRefresh()
       // tableView.register(SelectAreaTableViewCell.self,forCellReuseIdentifier: "cityCell")

        
        //HandelRefresh()
//        if let index = self.tableView.indexPathForSelectedRow{
//            self.tableView.deselectRow(at: index, animated: true)
//        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        self.tabBarController?.tabBar.isHidden = true
        if let index = self.tableView.indexPathForSelectedRow{
            self.tableView.deselectRow(at: index, animated: true)
        }
    }
  

    
    @IBAction func saveAndNextBtn(_ sender: UIButton) {
        print("area id = \(countryId)" )

        let homeVC =  self.storyboard!.instantiateViewController(withIdentifier: "goSIgnUp") as! SignUpViewController
        if countryId == 0 {
            self.showAlert(title: "Error".localize, messages: nil, message: "Please Choose country at first".localize, selfDismissing: false)
        }else{
           // homeVC.areaTxtField.text = self.countryName
            homeVC.countryName = self.countryName!
            homeVC.countryId = self.countryId
            
            print("name is \(countryName)")
            self.present(homeVC, animated: false, completion: nil)
        }
//
     }

}



// search area tableView Cell
extension SelectAreaViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("countryArray \(countryArray.count)")
        return countryArray.count
    }//end of numberOfRowsInSection
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell" , for: indexPath) as! SelectAreaTableViewCell

        if self.getCurrentDeviceLanguage() == "ar" {
            cell.cityLabel.text = countryArray[indexPath.row].title

        }else if self.getCurrentDeviceLanguage() == "en"{
            cell.cityLabel.text = countryArray[indexPath.row].titleEng
        }
        
        return cell
    }//end of cellForRowAt
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 60
        
    }//end of heightForRowAt
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let searchResult = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "goSIgnUp") as? SignUpViewController
        countryId = countryArray[indexPath.row].id!
        countryName = countryArray[indexPath.row].titleEng!
        if delegate != nil{
            delegate?.sendCountryId_Name(CountryId: countryId, CountryName: countryName!)
        }
        searchResult?.countryId = countryArray[indexPath.row].id!
        searchResult?.countryName = countryArray[indexPath.row].titleEng!

        self.navigationController?.popViewController(animated: true)

    }
    
//    private func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath) {
//        print("selected cell")
//    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cellToDeSelect:UITableViewCell = tableView.cellForRow(at: indexPath)!
        cellToDeSelect.contentView.backgroundColor = UIColor.white
        
        print("selected cell")

    }

    
    

    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
                let count = self.countryArray.count
        
                if indexPath.row == count-1 {
                    if LoadType == true{
                        loadMore()
                        print("loadmore")
        
                    }else{
                        SearchLoadMore()
                        print("searchloadmore")
                    }
            }
}


        
     

        
        
  
}//end of extension


extension SelectAreaViewController : UITextFieldDelegate{

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
        searchTextField.resignFirstResponder()
        return true
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if textField.text!.count == 0{
            keyFlag = "country"
            handelRefresh()
        }else{
            keyFlag = "countryKey"
            searchKey = textField.text!
            print("textField \(searchKey)")
            searchHandelRefresh()
        }
    }
 
    
//    @objc func textFieldDidChange(_ textField: UITextField) {
//        if textField.text!.count == 0{
//            handelRefresh()
//        }else{
//            searchKey = textField.text!
//            print("textField \(searchKey)")
//        }
//    }
}
