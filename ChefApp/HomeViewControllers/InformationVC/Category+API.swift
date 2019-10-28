////
////  Category+API.swift
////  ChefApp
////
////  Created by Admin on 10/24/19.
////  Copyright © 2019 Admin. All rights reserved.
////
//
import Foundation
var categoryFlag = ""
//extension AddCategoryPopUpViewController{
//    @objc func HandelRefresh(){
//        self.refresher.endRefreshing()
//        guard !isLoading else {return}
//        isLoading = true
//        API.showSVProgress()
//        if categoryFlag == "cate"{
//            API.GetCategory(serachKey: "") { (sucess, categoryArray, last_page) in
//                if sucess! && categoryArray != nil{
//                    print("its ok")
//                    self.isLoading = false
//                    if let categoryArray = categoryArray{
//                        self.categoryArray = categoryArray
//                        self.current_page = 1
//                        self.last_page = last_page
//                        API.dismissSVProgress()
//
//                    }
//                }else if sucess! && categoryArray == nil{
//                    self.showToast(message: "There Is Error".localize)
//                }else{
//                    self.showAlert(title: "Error".localize, messages: nil, message: "There Is No Internet Connection".localize , selfDismissing: false)
//                }
//            }
//        }else if categoryFlag == "cateKey"{
//            API.GetCategory(serachKey: searchKey) { (sucess, categoryArray, last_page) in
//                if sucess! && categoryArray != nil{
//                    print("its ok")
//                    self.isLoading = false
//                    if let categoryArray = categoryArray{
//                        self.categoryArray = categoryArray
//                        self.current_page = 1
//                        self.last_page = last_page
//                        API.dismissSVProgress()
//
//                    }
//                }else if sucess! && categoryArray == nil{
//                    self.showToast(message: "There Is Error".localize)
//                }else{
//                    self.showAlert(title: "Error".localize, messages: nil, message: "There Is No Internet Connection".localize , selfDismissing: false)
//                }
//            }
//        }
//    }//end of handel refresh
//    //to handel refresh for frist time
//
//    func LoadMore(){
//        guard !isLoading else{ return}
//
//        guard current_page < last_page else {return}
//        print("current_page\(current_page),last_page\(last_page)")
//        isLoading = true
//        if categoryFlag == "cate"{
//            API.GetCategory(page: current_page+1, serachKey: "") { (sucess, categoryArray, last_page) in
//                if sucess! && categoryArray != nil{
//                    print("its ok")
//                    self.isLoading = false
//                    self.isLoading = false
//                    if let categoryArray = categoryArray{
//                        self.categoryArray.append(contentsOf: categoryArray)
//                        API.dismissSVProgress()
//                        self.current_page += 1
//                        self.last_page = last_page
//                    }
//                }else if sucess! && categoryArray == nil{
//                    self.showToast(message: "There Is Error".localize)
//                }else{
//                    self.showAlert(title: "Error".localize, messages: nil, message: "There Is No Internet Connection".localize , selfDismissing: false)
//                }
//            }
//
//        }//end of key flag if
//        else if  categoryFlag == "cateKey"{
//            API.GetCategory(page: current_page+1, serachKey: searchKey) { (sucess, categoryArray, last_page) in
//                if sucess! && categoryArray != nil{
//                    print("its ok")
//                    self.isLoading = false
//                    self.isLoading = false
//                    if let categoryArray = categoryArray{
//                        self.categoryArray.append(contentsOf: categoryArray)
//                        API.dismissSVProgress()
//                        self.current_page += 1
//                        self.last_page = last_page
//                    }
//                }else if sucess! && categoryArray == nil{
//                    self.showToast(message: "There Is Error".localize)
//                }else{
//                    self.showAlert(title: "Error".localize, messages: nil, message: "There Is No Internet Connection".localize , selfDismissing: false)
//                }
//            }
//        }
//    }
//}//end of extension
//}


extension AddCategoryPopUpViewController{
    @objc func HandelRefresh(){
        self.refresher.endRefreshing()
        guard !isLoading else {return}
        isLoading = true
        API.showSVProgress()
        API.Category { (error: Error?, category: [CategoryData]?, last_page: Int ) in
            if error == nil && category == nil && last_page == 0{
                
                API.dismissSVProgress()
                
            }else{
                self.isLoading = false
                if let category = category{
                    self.categoryArray = category
                    self.tableView.reloadData()
                    self.current_page = 1
                    self.last_page = last_page
                    API.dismissSVProgress()
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
        API.Category(page: current_page+1) { (error: Error?, category: [CategoryData]?, last_page: Int ) in
            if error == nil && category == nil && last_page == 0{
                
                API.dismissSVProgress()
                
            }else{
                self.isLoading = false
                if let category = category{
                    self.categoryArray.append(contentsOf: category)
                    API.dismissSVProgress()
                    self.tableView.reloadData()
                    self.current_page += 1
                    self.last_page = last_page
                }
            }
        }
    }
}//end of extension
