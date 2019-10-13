//
//  GetAreaExtension.swift
//  ChefApp
//
//  Created by Admin on 10/10/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation

import UIKit
extension SelectAreaViewController {
    //            keyFlag = "countryKey"
    //    keyFlag = "country"
    
    @objc func HandelRefresh(){
        self.refresher.endRefreshing()
        guard !isLoading else {return}
        isLoading = true
        API.showSVProgress()
        if keyFlag == "city" {
            API.Country(key: "", countryId: countryId) { (sucess, countryArray, last_page) in
                if sucess && countryArray != nil{
                    print("running")
                    self.isLoading = false
                    if let countryArray = countryArray{
                        self.countryArray = countryArray
                        self.tableView.reloadData()
                        self.current_page = 1
                        self.last_page = last_page
                        API.dismissSVProgress()
                    }
                }else if sucess && countryArray == nil{
                    self.showToast(message: "There Is Error".localize)
                }else{
                    self.showAlert(title: "Error".localize, messages: nil, message: "There Is No Internet Connection".localize , selfDismissing: false)
                }
            }
        }//end of if key flag
        else if keyFlag == "cityKey"{
            API.Country(key: searchKey, countryId: countryId!) { (sucess, countryArray, last_page) in
                if sucess && countryArray != nil{
                    print("its ok")
                    self.isLoading = false
                    if let countryArray = countryArray{
                        self.countryArray = countryArray
                        self.tableView.reloadData()
                        self.current_page = 1
                        self.last_page = last_page
                        API.dismissSVProgress()
                    }
                }else if sucess && countryArray == nil{
                    self.showToast(message: "There Is Error".localize)
                }else{
                    self.showAlert(title: "Error".localize, messages: nil, message: "There Is No Internet Connection".localize , selfDismissing: false)
                }
            }
        }
        
    }//end of handel refresh
    //to handel refresh for frist time
    func LoadMore(){
        guard !isLoading else{ return}
        
        guard current_page < last_page else {return}
        print("current_page\(current_page),last_page\(last_page)")
        isLoading = true
        if keyFlag == "city" {
            API.Country(page: current_page+1, key: "", countryId: countryId!) { (sucess, countryArray, last_page) in
                if sucess && countryArray != nil{
                    print("its ok")
                    self.isLoading = false
                    self.isLoading = false
                    if let countryArray = countryArray{
                        self.countryArray.append(contentsOf: countryArray)
                        API.dismissSVProgress()
                        self.tableView.reloadData()
                        self.current_page += 1
                        self.last_page = last_page
                    }
                }else if sucess && countryArray == nil{
                    self.showToast(message: "There Is Error".localize)
                }else{
                    self.showAlert(title: "Error".localize, messages: nil, message: "There Is No Internet Connection".localize , selfDismissing: false)
                }
            }
            
        }//end of key flag if
        else if keyFlag == "cityKey"{
            API.Country(page: current_page+1, key: searchKey, countryId: countryId!) { (sucess, countryArray, last_page) in
                if sucess && countryArray != nil{
                    print("its ok")
                    self.isLoading = false
                    self.isLoading = false
                    if let countryArray = countryArray{
                        self.countryArray.append(contentsOf: countryArray)
                        API.dismissSVProgress()
                        self.tableView.reloadData()
                        self.current_page += 1
                        self.last_page = last_page
                    }
                }else if sucess && countryArray == nil{
                    self.showToast(message: "There Is Error".localize)
                }else{
                    self.showAlert(title: "Error".localize, messages: nil, message: "There Is No Internet Connection".localize , selfDismissing: false)
                }
            }
        }
    }
    
    
}//end of extension
