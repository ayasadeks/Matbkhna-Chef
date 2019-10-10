//
//  RACountry
//  ChefApp
//
//  Created by Admin on 10/10/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit
var keyFlag = ""
class RACountry: UIViewController  {

    
//    @IBOutlet weak var tableView: UITableView!
//    @IBOutlet weak var searchTextFeild: leftImage_cornerRadious!
//    var cityNamee: String?
//    var countryNamee: String?
//    var countryID : Int?
//    var delegate : passCityNameTofirstView?
//
//    //pagination variables i used
//    var countryArray = [AreaArrayData]()
//    var searchKey = String()
//    var current_page = 1
//    var last_page = 1
//    var isLoading : Bool = false
//
//    //to make table view refresh
////    lazy var refresher: UIRefreshControl = {
////        let refresher = UIRefreshControl()
////        refresher.addTarget(self, action: #selector(HandelRefresh), for: .valueChanged)
////        return refresher
////    }()
//    override func viewDidLoad() {
//        super.viewDidLoad()
//       // self.backBtn()
//        //to delete extra cells in table view
//        self.title = "Choose Country".localize
//        self.searchTextFeild.placeholder = "Enter Your SearchKey".localize
//
//        tableView.tableFooterView = UIView()
//        tableView.separatorInset = .zero
//        tableView.contentInset = .zero
//       // tableView.addSubview(refresher)
//        keyFlag = "country"
//        searchTextFeild.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
//       // HandelRefresh()
//    }
////    //use protocol&delegate (to pass data from city to location view controller... to pass data from C -> A we pass it from C -> B then from B -> c)
//
//    func setCityAndCountryNameFunc(cityName: String, countryName: String, locationID: Int) {
//        cityNamee = cityName
//        countryNamee = countryName
//        countryID = locationID
//        print("countryNamee= \(String(describing: countryNamee!))cityNamee=\(String(describing: cityNamee!))")
//        if delegate != nil{
//            delegate?.passCityNameTofirstViewFunc(cityName: cityNamee! , countryName: self.countryNamee!, LocatioID: countryID!)
//        }
//        navigationController!.popToViewController(navigationController!.viewControllers[1], animated: false)
//    }
//}
//
//extension RACountry : UITextFieldDelegate{
//    @objc func textFieldDidChange(_ textField: UITextField) {
//        if textField.text!.count == 0{
//            keyFlag = "country"
//           // HandelRefresh()
//        }else{
//            keyFlag = "countryKey"
//            searchKey = textField.text!
//            print("textField \(searchKey)")
//          //  HandelRefresh()
//        }
//    }
}
