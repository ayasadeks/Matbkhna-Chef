//
//  APIGetWorkingHourResturantDetailes.swift
//  Mtbakhna
//
//  Created by Rania on 9/14/19.
//  Copyright © 2019 Rania. All rights reserved.
//

import UIKit
import Kingfisher
extension RAResturantDetailes {
    func WorkingHourData(){
        let url = URLS.getWorkHour + "206/getWorkHours"
        API.GetData(AllWorkingHoursResponseData.self, language: self.getCurrentDeviceLanguage(), url: url, method: .get, parameters: nil, userToken: nil) {[weak self] (result) in
            guard let self = self else {return}
            switch result {
            case .success(let model):
                if model.data?.count != 0{
                    print("model = \(model)")
                    self.workingHourArray = model.data!
                    self.opencloseLabel.text = "open at: ".localize + "\(self.workingHourArray[0].open!)" +  " ,close at: ".localize + "\(self.workingHourArray[0].close!) "
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
