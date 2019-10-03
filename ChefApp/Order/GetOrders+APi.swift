//
//  GetDishes+APi.swift
//  Mtbkhna_Cooker
//
//  Created by apple on 6/15/19.
//  Copyright © 2019 Mobileaders. All rights reserved.
//

import UIKit
//to handel data in main screen

extension OrderViewController {
@objc func HandelRefresh(){
    self.refresher.endRefreshing()
    guard !isLoading else {return}
    isLoading = true
    API.GetData(AllOrderResponseData.self, language: self.getCurrentDeviceLanguage(), url: URLS.getOrder, method: .get, parameters: ["api_token" : "UzJMtttbYhAbfsD4GbChQjtf4KgYQPTPCSUKESBGgcGCQnCQ0zS5PTU6oQSwlmZDSoso9EBmNa5cklmAwIn5i8X9Ftw1Hnk9UuQsS1pGAU8wZWs7dPA3IsGFx4KTZNlSyKNN0AouUzruj2QTMFA73H"], userToken: nil) {[weak self] (result) in
        guard let self = self else {return}
        switch result {
        case .success(let model):
            self.isLoading = false
            if model.data?.count != 0{
                     print("model = \(model)")
                self.orderArray = model.data!
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
        API.GetData(AllOrderResponseData.self, language: self.getCurrentDeviceLanguage(), url: URLS.getOrder, method: .get, parameters: ["api_token" : "UzJMtttbYhAbfsD4GbChQjtf4KgYQPTPCSUKESBGgcGCQnCQ0zS5PTU6oQSwlmZDSoso9EBmNa5cklmAwIn5i8X9Ftw1Hnk9UuQsS1pGAU8wZWs7dPA3IsGFx4KTZNlSyKNN0AouUzruj2QTMFA73H"], userToken: nil) {[weak self] (result) in
            guard let self = self else {return}
            switch result {
            case .success(let model):
                self.isLoading = false
                if model.data?.count != 0{
                    print("model = \(model)")
                    self.orderArray.append(contentsOf: model.data!)
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










    
    
    
    
    
//    func loadMore(){
//        guard !isLoading else{ return}
//        
//        guard current_page < last_page else {return}
//        print("current_page\(current_page),last_page\(last_page)")
//        isLoading = true
//        API.GetAllOrderData(api_token: api_token!) { (sucess, orderArray, last_page) in
//            if !sucess!{
//                API.dismissSVProgress()
//                self.showAlert(title: "Error".localize, messages: nil, message: "There Is No Internet Connection".localize , selfDismissing: false)
//            }else{
//                self.isLoading = false
//                if let orderArr = orderArray{
//                    self.orderArray.append(contentsOf: orderArr)
//                    API.dismissSVProgress()
//                    
//                    self.tableView.reloadData()
//                    self.current_page += 1
//                    self.last_page = last_page!
//                    
//                }
//            }
//
//        }
//    }

