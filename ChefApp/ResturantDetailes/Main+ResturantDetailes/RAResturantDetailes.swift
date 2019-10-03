//
//  RAResturantDetailes.swift
//  Mtbakhna
//
//  Created by Rania on 9/14/19.
//  Copyright © 2019 Rania. All rights reserved.
//

import UIKit
import Cosmos
class RAResturantDetailes: UIViewController {
//resturantDetailesVC
    @IBOutlet weak var RedetailesLabel: UILabel!
    @IBOutlet weak var ReNameLabel: UILabel!
    @IBOutlet weak var ReImage: CircleImageView!
    
    @IBOutlet weak var ReCloseTimeLabel: UILabel!
    @IBOutlet weak var ReTimeStatusLabel: UILabel!
    @IBOutlet weak var ReRatingView: CosmosView!
    
    @IBOutlet weak var menuBtn: ButtonCornerRadious!
    @IBOutlet weak var reviewsBtn: ButtonCornerRadious!
    @IBOutlet weak var aboutBtn: ButtonCornerRadious!
    
    @IBOutlet weak var menuTextLabel: UILabel!
    @IBOutlet weak var aboutTextLabel: UILabel!
    @IBOutlet weak var timeOfWorkTextLabel: UILabel!
    @IBOutlet weak var reviewsTextLabel: UILabel!
    
    @IBOutlet weak var aboutTextView: UITextView!
    
    @IBOutlet weak var satardayBtn: ButtonCornerRadious!
    
    @IBOutlet weak var fridayBtn: ButtonCornerRadious!
    @IBOutlet weak var thirsdayBtn: ButtonCornerRadious!
    @IBOutlet weak var wensdayBtn: ButtonCornerRadious!
    @IBOutlet weak var tuesdayBtn: ButtonCornerRadious!
    @IBOutlet weak var mondayBtn: ButtonCornerRadious!
    @IBOutlet weak var sundayBtn: ButtonCornerRadious!
    
    @IBOutlet weak var opencloseLabel: UILabel!
    
    
    @IBOutlet weak var reviewCollectionView: UICollectionView!
    @IBOutlet weak var dishesCollectionView: UICollectionView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var ResturantDetailesData = [ResturantsDetailesDataArrayModel]()
    var dishArray = [DiahDataArray]()
    var workingHourArray = [WorkingHouresDataArray]()

    var resturantId = Int()
    var current_page = 1
    var last_page = 1
    var isLoading : Bool = false
    var dishImageUrl = String()
    lazy var refresher: UIRefreshControl = {
        let refresher = UIRefreshControl()
        refresher.addTarget(self, action: #selector(HandelRefresh), for: .valueChanged)
        return refresher
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        menuBtn.backgroundColor = #colorLiteral(red: 1, green: 0.8745098039, blue: 0.1882352941, alpha: 1)
        satardayBtn.backgroundColor = #colorLiteral(red: 1, green: 0.8745098039, blue: 0.1882352941, alpha: 1)


        aboutBtn.backgroundColor = UIColor.clear
        reviewsBtn.backgroundColor = UIColor.clear
        localize()
        ResturantData()
        HandelRefresh()
        WorkingHourData()
    }
    @IBAction func handelScreenBtnsAction(_ sender: ButtonCornerRadious) {
        if sender.tag == 1{
            menuBtn.backgroundColor = #colorLiteral(red: 1, green: 0.8745098039, blue: 0.1882352941, alpha: 1)
            aboutBtn.backgroundColor = UIColor.clear
            reviewsBtn.backgroundColor = UIColor.clear
            scrollView.setContentOffset(CGPoint(x: 0, y: 428), animated: true)

        }else if sender.tag == 2{
            menuBtn.backgroundColor = UIColor.clear
            aboutBtn.backgroundColor = #colorLiteral(red: 1, green: 0.8745098039, blue: 0.1882352941, alpha: 1)
            reviewsBtn.backgroundColor = UIColor.clear
            scrollView.setContentOffset(CGPoint(x: 0, y: 879), animated: true)

        }else if sender.tag == 3{
            aboutBtn.backgroundColor = UIColor.clear
            menuBtn.backgroundColor = UIColor.clear
            reviewsBtn.backgroundColor = #colorLiteral(red: 1, green: 0.8745098039, blue: 0.1882352941, alpha: 1)
            scrollView.setContentOffset(CGPoint(x: 0, y: 1231), animated: true)


        }
    }
    
    @IBAction func daysBtnAction(_ sender: ButtonCornerRadious) {
        let buttonId = (sender as AnyObject).tag
        
        switch buttonId {
        case 1:
            satardayBtn.backgroundColor = #colorLiteral(red: 1, green: 0.8745098039, blue: 0.1882352941, alpha: 1)
            sundayBtn.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9176470588, blue: 0.9176470588, alpha: 1)
            mondayBtn.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9176470588, blue: 0.9176470588, alpha: 1)
            tuesdayBtn.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9176470588, blue: 0.9176470588, alpha: 1)
            wensdayBtn.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9176470588, blue: 0.9176470588, alpha: 1)
            thirsdayBtn.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9176470588, blue: 0.9176470588, alpha: 1)
            fridayBtn.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9176470588, blue: 0.9176470588, alpha: 1)
            print("sbt")
            for time in workingHourArray{
                if time.day == "Saturday"{
                    opencloseLabel.text = "open at: ".localize + "\(time.open!)" +  " ,close at: ".localize + "\(time.close!) "
                }
            }
            break
            
        case 2:
            satardayBtn.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9176470588, blue: 0.9176470588, alpha: 1)
            sundayBtn.backgroundColor = #colorLiteral(red: 1, green: 0.8745098039, blue: 0.1882352941, alpha: 1)
            mondayBtn.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9176470588, blue: 0.9176470588, alpha: 1)
            tuesdayBtn.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9176470588, blue: 0.9176470588, alpha: 1)
            wensdayBtn.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9176470588, blue: 0.9176470588, alpha: 1)
            thirsdayBtn.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9176470588, blue: 0.9176470588, alpha: 1)
            fridayBtn.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9176470588, blue: 0.9176470588, alpha: 1)
            print("7d")
            for time in workingHourArray{
                if time.day == "Sunday"{
                    opencloseLabel.text = "open at: ".localize + "\(time.open!)" +  " ,close at: ".localize + "\(time.close!) "
                }
            }
            break
            
        case 3:
            satardayBtn.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9176470588, blue: 0.9176470588, alpha: 1)
            sundayBtn.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9176470588, blue: 0.9176470588, alpha: 1)
            mondayBtn.backgroundColor = #colorLiteral(red: 1, green: 0.8745098039, blue: 0.1882352941, alpha: 1)
            tuesdayBtn.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9176470588, blue: 0.9176470588, alpha: 1)
            wensdayBtn.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9176470588, blue: 0.9176470588, alpha: 1)
            thirsdayBtn.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9176470588, blue: 0.9176470588, alpha: 1)
            fridayBtn.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9176470588, blue: 0.9176470588, alpha: 1)
            print("etnen")
            for time in workingHourArray{
                if time.day == "Monday"{
                    opencloseLabel.text = "open at: ".localize + "\(time.open!)" +  " ,close at: ".localize + "\(time.close!) "
                }
            }
            break
            
            
        case 4:
            satardayBtn.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9176470588, blue: 0.9176470588, alpha: 1)
            sundayBtn.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9176470588, blue: 0.9176470588, alpha: 1)
            mondayBtn.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9176470588, blue: 0.9176470588, alpha: 1)
            tuesdayBtn.backgroundColor = #colorLiteral(red: 1, green: 0.8745098039, blue: 0.1882352941, alpha: 1)
            wensdayBtn.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9176470588, blue: 0.9176470588, alpha: 1)
            thirsdayBtn.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9176470588, blue: 0.9176470588, alpha: 1)
            fridayBtn.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9176470588, blue: 0.9176470588, alpha: 1)
            print("tlat")
            for time in workingHourArray{
                if time.day == "Tuesday"{
                    opencloseLabel.text = "open at: ".localize + "\(time.open!)" +  " ,close at: ".localize + "\(time.close!) "
                }
            }
            break
            
            
        case 5:
            satardayBtn.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9176470588, blue: 0.9176470588, alpha: 1)
            sundayBtn.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9176470588, blue: 0.9176470588, alpha: 1)
            mondayBtn.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9176470588, blue: 0.9176470588, alpha: 1)
            tuesdayBtn.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9176470588, blue: 0.9176470588, alpha: 1)
            wensdayBtn.backgroundColor = #colorLiteral(red: 1, green: 0.8745098039, blue: 0.1882352941, alpha: 1)
            thirsdayBtn.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9176470588, blue: 0.9176470588, alpha: 1)
            fridayBtn.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9176470588, blue: 0.9176470588, alpha: 1)
            print("arb3")
            for time in workingHourArray{
                if time.day == "wednesday"{
                    opencloseLabel.text = "open at: ".localize + "\(time.open!)" +  " ,close at: ".localize + "\(time.close!) "
                }
            }
            break
            
            
        case 6:
            satardayBtn.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9176470588, blue: 0.9176470588, alpha: 1)
            sundayBtn.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9176470588, blue: 0.9176470588, alpha: 1)
            mondayBtn.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9176470588, blue: 0.9176470588, alpha: 1)
            tuesdayBtn.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9176470588, blue: 0.9176470588, alpha: 1)
            wensdayBtn.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9176470588, blue: 0.9176470588, alpha: 1)
            thirsdayBtn.backgroundColor = #colorLiteral(red: 1, green: 0.8745098039, blue: 0.1882352941, alpha: 1)
            fridayBtn.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9176470588, blue: 0.9176470588, alpha: 1)
            print("kh")
            for time in workingHourArray{
                if time.day == "Thursday"{
                    opencloseLabel.text = "open at: ".localize + "\(time.open!)" +  " ,close at: ".localize + "\(time.close!) "
                }
            }
            break
            
            
        default:
            satardayBtn.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9176470588, blue: 0.9176470588, alpha: 1)
            sundayBtn.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9176470588, blue: 0.9176470588, alpha: 1)
            mondayBtn.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9176470588, blue: 0.9176470588, alpha: 1)
            tuesdayBtn.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9176470588, blue: 0.9176470588, alpha: 1)
            wensdayBtn.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9176470588, blue: 0.9176470588, alpha: 1)
            thirsdayBtn.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9176470588, blue: 0.9176470588, alpha: 1)
            fridayBtn.backgroundColor = #colorLiteral(red: 1, green: 0.8745098039, blue: 0.1882352941, alpha: 1)
            print("f")
            for time in workingHourArray{
                if time.day == "Friday"{
                    opencloseLabel.text = "open at: ".localize + "\(time.open!)" +  " ,close at: ".localize + "\(time.close!) "
                }
            }
            break
        }
    }
    func localize(){
        satardayBtn.setTitle("Saturday".localize, for: .normal)
        sundayBtn.setTitle("Sunday".localize, for: .normal)
        mondayBtn.setTitle("Monday".localize, for: .normal)
        tuesdayBtn.setTitle("Tuesday".localize, for: .normal)
        wensdayBtn.setTitle("Wednesday".localize, for: .normal)
        thirsdayBtn.setTitle("Thursday".localize, for: .normal)
        fridayBtn.setTitle("Friday".localize, for: .normal)
        
        menuBtn.setTitle("Menu".localize, for: .normal)
        aboutBtn.setTitle("About".localize, for: .normal)
        reviewsBtn.setTitle("Reviews".localize, for: .normal)
        
        timeOfWorkTextLabel.text = "Times of work".localize
        menuTextLabel.text = "Menu".localize
        aboutTextLabel.text = "About".localize
        reviewsTextLabel.text = "Reviews".localize
    }
    
}
