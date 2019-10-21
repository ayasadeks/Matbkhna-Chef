////
////  GetArea.swift
////  ChefApp
////
////  Created by Admin on 10/21/19.
////  Copyright © 2019 Admin. All rights reserved.
////
//
//import Foundation
//import UIKit
//extension SelectAreaViewController{
//    @objc func HandelRefresh(){
//        self.refresher.endRefreshing()
//        guard !isLoading else {return}
//        isLoading = true
//        API.showSVProgress()
//        API.Country { (error: Error?, country: [AreaArrayData]?, last_page: Int ) in
//            if error == nil && country == nil && last_page == 0{
//                
//                API.dismissSVProgress()
//                
//            }else{
//                self.isLoading = false
//                if let country = country{
//                    self.countryArray = country
//                    self.tableView.reloadData()
//                    self.current_page = 1
//                    self.last_page = last_page
//                    API.dismissSVProgress()
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
//        API.Country(page: current_page+1) { (error: Error?, country: [AreaArrayData]?, last_page: Int ) in
//            if error == nil && country == nil && last_page == 0{
//                
//                API.dismissSVProgress()
//                
//            }else{
//                self.isLoading = false
//                if let country = country{
//                    self.countryArray.append(contentsOf: country)
//                    
//                    API.dismissSVProgress()
//                    self.tableView.reloadData()
//                    self.current_page += 1
//                    self.last_page = last_page
//                }
//            }
//        }
//    }
//}//end of extension
