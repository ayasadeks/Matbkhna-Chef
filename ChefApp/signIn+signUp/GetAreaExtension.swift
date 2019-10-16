//
//  GetAreaExtension.swift
//  ChefApp
//
//  Created by Admin on 10/10/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation

extension SelectAreaViewController {
    @objc func HandelRefresh(){
        self.refresher.endRefreshing()
        guard !isLoading else {return}
        isLoading = true
        if keyFlag == "country" {
            API.GetData(AllResponseData.self, language: self.getCurrentDeviceLanguage(), url: URLS.country, method: .get, parameters: ["page": 1], userToken: nil) {[weak self] (result) in
                guard let self = self else {return}
                switch result {
                case .success(let model):
                    self.isLoading = false
                    if model.data?.count != 0{
                        print("model = \(model)")
                        self.countryArray = model.data!
                        self.tableView.reloadData()
                        self.current_page = 1
                        self.last_page = (model.paginate?.total_pages!)!
                    }
                    break
                case .failure(let err):
                    print(err!.localizedDescription)
                case .noConnection(let Message):
                    self.showAlert(title: "Error".localize, messages: nil, message: Message!, selfDismissing: false)
                }
            }
            
        }//end of if key flag
        else if keyFlag == "countryKey"{
            API.GetData(AllResponseData.self, language: self.getCurrentDeviceLanguage(), url: URLS.country, method: .get, parameters: ["page": 1 , "keyword" : searchKey ], userToken: nil) {[weak self] (result) in
                guard let self = self else {return}
                switch result {
                case .success(let model):
                    self.isLoading = false
                    
                    if model.data?.count != 0{
                        print("model = \(model)")
                        self.countryArray = model.data!
                        self.tableView.reloadData()
                        self.current_page = 1
                        self.last_page = (model.paginate?.total_pages!)!
                    }
                    break
                case .failure(let err):
                    print(err!.localizedDescription)
                case .noConnection(let Message):
                    self.showAlert(title: "Error".localize, messages: nil, message: Message!, selfDismissing: false)
                }
            }
        }
    }//end of handel refresh
    //to handel refresh for frist time
    func LoadMore(){
        guard !isLoading else{ return}
        print("current_page\(current_page)")
        print("last_page\(last_page)")
        
        guard current_page < last_page else {return}
        isLoading = true
        if keyFlag == "country" {
            API.GetData(AllResponseData.self, language: self.getCurrentDeviceLanguage(), url: URLS.country, method: .get, parameters: ["page": current_page+1], userToken: nil) {[weak self] (result) in
                guard let self = self else {return}
                switch result {
                case .success(let model):
                    self.isLoading = false
                    if model.data?.count != 0{
                        print("model = \(model)")
                        self.countryArray.append(contentsOf: model.data!)
                        self.tableView.reloadData()
                        self.current_page += 1
                        self.last_page = (model.paginate?.total_pages!)!
                    }
                    break
                case .failure(let err):
                    print(err!.localizedDescription)
                case .noConnection(let Message):
                    self.showAlert(title: "Error".localize, messages: nil, message: Message!, selfDismissing: false)
                }
            }
            
        }//end of if key flag
        else if keyFlag == "countryKey"{
            API.GetData(AllResponseData.self, language: self.getCurrentDeviceLanguage(), url: URLS.country, method: .get, parameters: ["page": current_page+1 , "keyword" : searchKey ], userToken: nil) {[weak self] (result) in
                guard let self = self else {return}
                switch result {
                case .success(let model):
                    self.isLoading = false
                    if model.data?.count != 0{
                        print("model = \(model)")
                        self.countryArray.append(contentsOf: model.data!)
                        self.tableView.reloadData()
                        self.current_page += 1
                        self.last_page = (model.paginate?.total_pages!)!
                        
                    }
                    break
                case .failure(let err):
                    print(err!.localizedDescription)
                case .noConnection(let Message):
                    self.showAlert(title: "Error".localize, messages: nil, message: Message!, selfDismissing: false)
                }
            }
        }
    }//end of load more function
}//end of extension
