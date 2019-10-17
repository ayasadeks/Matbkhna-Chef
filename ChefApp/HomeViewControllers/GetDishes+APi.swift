//
//  GetDishes+Api.swift
//  ChefApp
//
//  Created by Admin on 9/19/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

extension HomeKitchenViewController{
    //to handel refresh for frist time
    @objc func HandelRefresh(){
        self.refresher.endRefreshing()
        guard !isLoading else {return}
        isLoading = true
        API.GetData(AllDishResponseData.self, language: self.getCurrentDeviceLanguage(), url: URLS.getDish, method: .get, parameters: ["page": 1 , "userId" : 206 , "photos": 1 , "extras" : 1], userToken: nil) {[weak self] (result) in
            guard let self = self else {return}
            switch result {
            case .success(let model):
                self.isLoading = false
                if model.data?.count != 0{
                    //                    print("model = \(model)")
                    self.dishArray = model.data!
                    //                    self.kitchenBaseUrlImage = model.imageUrl!
                    self.tableView.reloadData()
                    self.current_page = 1
                    self.last_page = (model.paginate?.total_pages!)!
                    self.dishImageUrl = model.imageUrl!
                
                }
                break
            case .failure(let err):
                print(err!.localizedDescription)
            case .noConnection(let Message):
                self.showAlert(title: "Error".localize, messages: nil, message: Message!, selfDismissing: false)
            }
        }
    }//end of handel refresh
        
    //to load more of table view
    func LoadMore(){
        guard !isLoading else{ return}
        print("current_page\(current_page)")
        print("last_page\(last_page)")
        
        guard current_page < last_page else {return}
        isLoading = true
        API.GetData(AllDishResponseData.self, language: self.getCurrentDeviceLanguage(), url: URLS.getDish, method: .get, parameters: ["page": current_page+1 , "userId" : 206 , "photos": 1 , "extras" : 1], userToken: nil) {[weak self] (result) in
            guard let self = self else {return}
            switch result {
            case .success(let model):
                self.isLoading = false
                if model.data?.count != 0{
                    print("model = \(model)")
                    self.dishArray.append(contentsOf: model.data!)
                    //                    self.kitchenBaseUrlImage = model.imageUrl!
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
    }//end of load more function
}//end of extension
