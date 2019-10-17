//
//  HomeKitchenViewController.swift
//  ChefApp
//
//  Created by Admin on 9/19/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit
import SwipeCellKit

class HomeKitchenViewController: UIViewController{

    @IBOutlet weak var tableView: UITableView!
    var dishArray = [DishDataArray]()
    var current_page = 1
    var last_page = 1
    var isLoading : Bool = false
    var dishImageUrl = String()

    var api_token = UserDefaultData.get_user_string_data(key: "userToken")
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        tableView.separatorInset = .zero
        tableView.contentInset = .zero
        tableView.addSubview(refresher)
        tableView.delegate = self
        tableView.dataSource = self

        HandelRefresh()
    }
    //to make table view refresh
    lazy var refresher: UIRefreshControl = {
        let refresher = UIRefreshControl()
        refresher.addTarget(self, action: #selector(HandelRefresh), for: .valueChanged)
        return refresher
    }()

    @IBAction func searchButton(_ sender: Any) {
        //go to next view controller
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "goSearch") as! SearchViewController
        self.present(nextViewController, animated: false, completion: nil)
    }
    @IBAction func addButton(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "goMenu") as! AddDishesViewController
        self.present(nextViewController, animated: false, completion: nil)
    }
}
    


    
extension HomeKitchenViewController : UITableViewDelegate, UITableViewDataSource, SwipeTableViewCellDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("dishArray.count\(dishArray.count)")
        return dishArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeKitchenTableViewCell
        cell.delegate = self
        
       // cell.configure(item: dishArray, index: indexPath, imageUrl: dishImageUrl)
        
        
        cell.nameOfFood.text = dishArray[indexPath.row].title
        cell.descriptionOfFood.text = dishArray[indexPath.row].description
        cell.priceOfFood.text = dishArray[indexPath.row].largePrice
    //    cell.imageOfFood.image = UIImage(named: dishArray[indexPath.row])

////
//        //there is no image
//        if dishArray[indexPath.row].photos!.count == 0{
//            var dishName = dishArray[indexPath.row].title
//            let fullNameArr = dishName!.characters.split{$0 == " "}.map(String.init)
//            for i in 0...fullNameArr.count-1{
//                if i == 0{
//                    let firstWord = fullNameArr[0].first
//                    cell.dishImageName.text = "\(firstWord!)"
//                }else if i == 1{
//                    let firstWord = fullNameArr[0].first
//                    let secondWord = fullNameArr[1].first
//                    getAllDishesTVC.dishImageName.text = "\(firstWord!) \(secondWord!)"
//                    getAllDishesTVC.dishImage.isHidden = true
//
//                }
//            }
//
//        }else{
//            getAllDishesTVC.dishImage.isHidden = false
//            getAllDishesTVC.dishImageName.isHidden = true
//            getAllDishesTVC.dishImageName.text = ""
//
//            var urlString = "http://mobileaders.com/mtbkhna/public/media/dishPhotos/" + "\(dishArray[indexPath.row].photos![0].url!)"
//            print("urlString\(urlString)")
//            let url = URL(string: urlString)
//            getAllDishesTVC.dishImage.kf.indicatorType = .activity
//            getAllDishesTVC.dishImage.kf.setImage(with: url)
//            {
//                result in
//                switch result {
//                case .success(let value):
//                    print("Task done for: \(value.source.url?.absoluteString ?? "")")
//                case .failure(let error):
//                    print("Job failed: \(error.localizedDescription)")
//                }
//            }
//        }
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let count = self.dishArray.count
        
        if indexPath.row == count-1 {
            LoadMore()
            print("loadmore")
            
        }
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else { return nil }
        
        let deleteAction = SwipeAction(style: .default, title: nil) { action, indexPath in
            // handle action by updating model with deletion
            
            //go to next view controller
//            let popvc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "deleteItemPopUp") as! DeleteItemPopUpViewController
//
//            self.addChild(popvc)
//
//            popvc.view.frame = self.view.frame
//
//            self.view.addSubview(popvc.view)
//
//            popvc.didMove(toParent: self)
          
            
        }
        deleteAction.transitionDelegate = ScaleTransition.default
        // customize the action appearance
        deleteAction.image = UIImage(named: "delete")
        return [deleteAction]
    }
    
    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
        var options = SwipeOptions()
        options.expansionStyle = .destructive
        options.transitionStyle = .border
        return options
    }

    

}
