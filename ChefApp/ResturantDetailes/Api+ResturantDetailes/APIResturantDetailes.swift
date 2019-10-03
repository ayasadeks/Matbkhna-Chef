//
//  APIResturantDetailes.swift
//  Mtbakhna
//
//  Created by Rania on 9/14/19.
//  Copyright © 2019 Rania. All rights reserved.
//

import UIKit
import Kingfisher
extension RAResturantDetailes {
    func ResturantData(){
        API.GetData(AllResturantsDetailesResponseData.self, language: self.getCurrentDeviceLanguage(), url: URLS.getResturant, method: .get, parameters: ["page": 1 , "id" : 206], userToken: nil) {[weak self] (result) in
            guard let self = self else {return}
            switch result {
            case .success(let model):
                if model.data?.count != 0{
//                    print("model = \(model)")
                    self.ResturantDetailesData = model.data!
                    let rateValue = self.ResturantDetailesData[0].rate!
                    let rateValueDouble = Double(rateValue)
                    self.ReNameLabel.text = self.ResturantDetailesData[0].name!
                    if self.ResturantDetailesData[0].openStatus == true{
                        self.ReTimeStatusLabel.text = "opening".localize
                    }else{
                        self.ReTimeStatusLabel.text = "closed".localize
                    }
                    self.ReRatingView.rating = rateValueDouble!
                    self.RedetailesLabel.text = self.ResturantDetailesData[0].description!
                    self.aboutTextView.text = self.ResturantDetailesData[0].description!
                    
                    if self.ResturantDetailesData[0].logo != nil{
                        var url = model.imageUrl! + "/\(self.ResturantDetailesData[0].logo!)"
                        let imageUrl = URL(string: url)
                        
                        self.ReImage.kf.indicatorType = .activity
                        self.ReImage.kf.setImage(with: imageUrl)
                        
                    }
                }
                break
            case .failure(let err):
                print(err!.localizedDescription)
            case .noConnection(let Message):
                self.showAlert(title: "Error".localize, messages: nil, message: Message!, selfDismissing: false)
            }
        }
    }//end of handel refresh
}//end of extension
