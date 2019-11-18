////
////  Category+API.swift
////  ChefApp
////
////  Created by Admin on 10/24/19.
////  Copyright © 2019 Admin. All rights reserved.
////
//
import Foundation

extension AddCategoryPopUpViewController {
    @objc func HandelRefresh(){
        self.refresher.endRefreshing()
        guard !isLoading else {return}
        isLoading = true
        API.GetData(AllCategoryResponseData.self, language: self.getCurrentDeviceLanguage(), url: URLS.getCategory, method: .get, parameters: ["page" : 1], userToken: nil) {[weak self] (result) in
            guard let self = self else {return}
            switch result {
            case .success(let model):
                self.isLoading = false
                if model.data?.count != 0{
                    print("model = \(model)")
                    self.categoryArray = model.data!
                    self.tableView.reloadData()
                    self.current_page = 1
                    self.last_page = (model.paginate?.total_pages!)!
                }
                break
            case .failure(let err):
                print("not success")
                print(err!.localizedDescription)
            case .noConnection(let Message):
                self.showAlert(title: "Error".localize, messages: nil, message: Message!, selfDismissing: false)
            }
        }
    }//end of handel refresh
    
    
    
    func LoadMore(){
        guard !isLoading else{ return}
        print("current_page\(current_page)")
        print("last_page\(last_page)")
        
        guard current_page < last_page else {return}
        isLoading = true
        API.GetData(AllCategoryResponseData.self, language: self.getCurrentDeviceLanguage(), url: URLS.getCategory, method: .get, parameters: ["page" : current_page+1], userToken: nil) {[weak self] (result) in
            guard let self = self else {return}
            switch result {
            case .success(let model):
                self.isLoading = false
                if model.data?.count != 0{
                    print("model = \(model)")
                    self.categoryArray.append(contentsOf: model.data!)
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














