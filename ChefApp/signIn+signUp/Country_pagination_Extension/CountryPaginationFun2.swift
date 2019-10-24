//
//  Function2.swift
//  Mtbkhna
//
//  Created by Macbook on 4/9/19.
//  Copyright © 2019 Mobileaders. All rights reserved.
//

import UIKit
//to handel data in main screen

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
                self.showToast(message: "لا يوجد اتصال بالأنترنت")

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
