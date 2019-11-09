////
////  GetAreaExtension.swift
////  ChefApp
////
////  Created by Admin on 10/10/19.
////  Copyright © 2019 Admin. All rights reserved.
////
//
//import Foundation
//import UIKit
////
//extension SelectAreaViewController {
//    @objc func HandelRefresh(){
//        self.refresher.endRefreshing()
//        guard !isLoading else {return}
//        isLoading = true
//        if keyFlag == "country" {
//            API.GetData(AllResponseData.self, language: self.getCurrentDeviceLanguage(), url: URLS.country, method: .get, parameters: ["page": 1], userToken: nil) {[weak self] (result) in
//                guard let self = self else {return}
//                switch result {
//                case .success(let model):
//                    self.isLoading = false
//                    if model.data?.count != 0{
//                        print("model = \(model)")
//                        self.countryArray = model.data!
//                        self.tableView.reloadData()
//                        self.current_page = 1
//                        self.last_page = (model.paginate?.total_pages!)!
//                    }
//                    break
//                case .failure(let err):
//                    print(err!.localizedDescription)
//                case .noConnection(let Message):
//                    self.showAlert(title: "Error".localize, messages: nil, message: Message!, selfDismissing: false)
//                }
//            }
//
//        }//end of if key flag
//        else if keyFlag == "countryKey"{
//            API.GetData(AllResponseData.self, language: self.getCurrentDeviceLanguage(), url: URLS.country, method: .get, parameters: ["page": 1 , "keyword" : searchKey ], userToken: nil) {[weak self] (result) in
//                guard let self = self else {return}
//                switch result {
//                case .success(let model):
//                    self.isLoading = false
//
//                    if model.data?.count != 0{
//                        print("model = \(model)")
//                        self.countryArray = model.data!
//                        self.tableView.reloadData()
//                        self.current_page = 1
//                        self.last_page = (model.paginate?.total_pages!)!
//                    }
//                    break
//                case .failure(let err):
//                    print(err!.localizedDescription)
//                case .noConnection(let Message):
//                    self.showAlert(title: "Error".localize, messages: nil, message: Message!, selfDismissing: false)
//                }
//            }
//        }
//    }//end of handel refresh
//    //to handel refresh for frist time
//    func LoadMore(){
//        guard !isLoading else{ return}
//        print("current_page\(current_page)")
//        print("last_page\(last_page)")
//
//        guard current_page < last_page else {return}
//        isLoading = true
//        if keyFlag == "country" {
//            API.GetData(AllResponseData.self, language: self.getCurrentDeviceLanguage(), url: URLS.country, method: .get, parameters: ["page": current_page+1], userToken: nil) {[weak self] (result) in
//                guard let self = self else {return}
//                switch result {
//                case .success(let model):
//                    self.isLoading = false
//                    if model.data?.count != 0{
//                        print("model = \(model)")
//                        self.countryArray.append(contentsOf: model.data!)
//                        self.tableView.reloadData()
//                        self.current_page += 1
//                        self.last_page = (model.paginate?.total_pages!)!
//                    }
//                    break
//                case .failure(let err):
//                    print(err!.localizedDescription)
//                case .noConnection(let Message):
//                    self.showAlert(title: "Error".localize, messages: nil, message: Message!, selfDismissing: false)
//                }
//            }
//
//        }//end of if key flag
//        else if keyFlag == "countryKey"{
//            API.GetData(AllResponseData.self, language: self.getCurrentDeviceLanguage(), url: URLS.country, method: .get, parameters: ["page": current_page+1 , "keyword" : searchKey ], userToken: nil) {[weak self] (result) in
//                guard let self = self else {return}
//                switch result {
//                case .success(let model):
//                    self.isLoading = false
//                    if model.data?.count != 0{
//                        print("model = \(model)")
//                        self.countryArray.append(contentsOf: model.data!)
//                        self.tableView.reloadData()
//                        self.current_page += 1
//                        self.last_page = (model.paginate?.total_pages!)!
//
//                    }
//                    break
//                case .failure(let err):
//                    print(err!.localizedDescription)
//                case .noConnection(let Message):
//                    self.showAlert(title: "Error".localize, messages: nil, message: Message!, selfDismissing: false)
//                }
//            }
//        }
//    }//end of load more function
//}//end of extension


///
import Foundation
import UIKit

extension SelectAreaViewController{
    //to handel refresh for frist time
    @objc func handelRefresh(){
        self.refresher.endRefreshing()
        guard !isLoading else {return}
        isLoading = true
        self.LoadType = true
        API.showSVProgress()
        
        API.Country { (error: Error?, country: [AreaArrayData]?, last_page: Int ) in
            if error == nil && country == nil && last_page == 0{
                self.showToast(message:"no internet connection")
                
                API.dismissSVProgress()
                
            }else{
                self.isLoading = false
                if let country = country{
                    self.countryArray = country
                    self.tableView.reloadData()
                    self.current_page = 1
                    self.last_page = last_page
                    API.dismissSVProgress()
                }
                
            }
        }
        
    }//end of handel refresh
    //to handel refresh for frist time
    
    func loadMore(){
        guard !isLoading else{ return}
        
        guard current_page < last_page else {return}
        print("current_page\(current_page),last_page\(last_page)")
        isLoading = true
        API.Country(page: current_page+1) { (error: Error?,country: [AreaArrayData]?, last_page: Int ) in
            if error == nil && country == nil && last_page == 0{
                self.showToast(message: "لا يوجد اتصال بالأنترنت")
                
                API.dismissSVProgress()
                
            }else{
                self.isLoading = false
                if let country = country{
                    self.countryArray.append(contentsOf: country)
                    API.dismissSVProgress()
                    self.tableView.reloadData()
                    self.current_page += 1
                    self.last_page = last_page
                }
            }
        }
    }
}

extension SelectAreaViewController {
    
    @objc func searchHandelRefresh(){
        self.refresher.endRefreshing()
        guard !isLoading else {return}
        isLoading = true
        API.showSVProgress()
        API.countrySearchKey(searchKey: searchKey) { (error: Error?, country: [AreaArrayData]?, last_page: Int ) in
            if error == nil && country == nil && last_page == 0{
                self.showToast(message: "no internet")
                
                API.dismissSVProgress()
                
            }else{
                self.isLoading = false
                self.LoadType = false
                if let country = country{
                    self.countryArray = country
                    self.tableView.reloadData()
                    self.current_page = 1
                    self.last_page = last_page
                    API.dismissSVProgress()
                }
            }
        }
        
    }//end of handel refresh
    //to handel refresh for frist time
    func SearchLoadMore(){
        guard !isLoading else{ return}
        
        guard current_page < last_page else {return}
        print("current_page\(current_page),last_page\(last_page)")
        isLoading = true
        API.countrySearchKey(page: current_page+1, searchKey: searchKey) { (error: Error?,country: [AreaArrayData]?, last_page: Int ) in
            if error == nil && country == nil && last_page == 0{
                self.showToast(message: "لا يوجد اتصال بالأنترنت")
                
                API.dismissSVProgress()
                
            }else{
                self.isLoading = false
                if let country = country{
                    self.countryArray.append(contentsOf: country)
                    API.dismissSVProgress()
                    self.tableView.reloadData()
                    self.current_page += 1
                    self.last_page = last_page
                }
            }
        }
    }
    
    
}//end of extension

