//
//  setWorkingDaysViewController.swift
//  ChefApp
//
//  Created by Admin on 9/23/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class setWorkingTimeViewController: UIViewController {

        var dayId = Int()
        var openTime = ""
        var closeTime = ""
        @IBOutlet weak var secondPickerView: UIDatePicker!
        @IBOutlet weak var saveBtn: ButtonCornerRadious!
        @IBOutlet weak var firstPickerView: UIDatePicker!
        override func viewDidLoad() {
            super.viewDidLoad()
            Localize()
            print("dayId\(dayId)")
            showDatePicker()
            let firstDate = firstPickerView.date
            let secondDate = secondPickerView.date
            
            let components = Calendar.current.dateComponents([.hour, .minute ], from: firstDate)
            let hour = components.hour!
            let minute = components.minute!
            if minute < 10 && hour < 10{
                openTime = "0\(hour):0\(minute)"
                
            }else if minute > 9 && hour > 9{
                openTime = "\(hour):\(minute)"
                
            }else if minute < 10 && hour > 9{
                openTime = "\(hour):0\(minute)"
                
            }else if minute > 9 && hour < 10{
                openTime = "0\(hour):\(minute)"
            }
            let components2 = Calendar.current.dateComponents([.hour, .minute ], from: secondDate)
            let hour2 = components2.hour!
            let minute2 = components2.minute!
            if minute2 < 10 && hour2 < 10{
                closeTime = "0\(hour2):0\(minute2)"
                
            }else if minute2 > 9 && hour2 > 9{
                closeTime = "\(hour2):\(minute2)"
                
            }else if minute2 < 10 && hour2 > 9{
                closeTime = "\(hour2):0\(minute2)"
                
            }else if minute2 > 9 && hour2 < 10{
                closeTime = "0\(hour2):\(minute2)"
            }
        }
        @IBAction func saveBtnAction(_ sender: Any) {
            print("save")
            API.SetWorkTime(open: openTime, close: closeTime, day: dayId) { (sucess) in
                if sucess!{
                    print("hi")
                    self.showToast(message: "Time Added Sucessufly".localize)
                    self.dismiss(animated: true, completion: nil)
//                    let getWorkingTimeVC =  self.storyboard!.instantiateViewController(withIdentifier: "workingDays") as! SetWorkingDaysViewController
//                    self.present(getWorkingTimeVC, animated: false, completion: nil)
                    let popvc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "goInformation") as! KitchenInformationViewController
                    
                    self.addChild(popvc)
                    
                    popvc.view.frame = self.view.frame
                    
                    self.view.addSubview(popvc.view)
                    
                    popvc.didMove(toParent: self)
                    
                }else{
                    self.showAlert(title: "Error".localize, messages: nil, message: "There Is No Internet Connection".localize , selfDismissing: false)
                }
            }
            
        }
        @IBAction func closeBtnAction(_ sender: Any) {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "goInformation") as! KitchenInformationViewController
            self.present(nextViewController, animated: false, completion: nil)
    }
        func Localize(){
            saveBtn.setTitle("Save".localize, for: .normal)
            
        }
        
        func showDatePicker(){
            let formatter = DateFormatter()
            firstPickerView.datePickerMode = .time
            secondPickerView.datePickerMode = .time
            formatter.timeStyle = .short
            firstPickerView.addTarget(self, action: #selector(self.openTimeDiveChanged), for: UIControl.Event.valueChanged)
            secondPickerView.addTarget(self, action: #selector(self.closeTimeDiveChanged), for: UIControl.Event.valueChanged)
            
        }
        
        
        @objc func openTimeDiveChanged(sender: UIDatePicker) {
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            let components = Calendar.current.dateComponents([.hour, .minute ], from: sender.date)
            let hour = components.hour!
            let minute = components.minute!
            if minute < 10 && hour < 10{
                openTime = "0\(hour):0\(minute)"
                
            }else if minute > 9 && hour > 9{
                openTime = "\(hour):\(minute)"
                
            }else if minute < 10 && hour > 9{
                openTime = "\(hour):0\(minute)"
                
            }else if minute > 9 && hour < 10{
                openTime = "0\(hour):\(minute)"
            }
        }
    
        @objc func closeTimeDiveChanged(sender: UIDatePicker) {
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            let components = Calendar.current.dateComponents([.hour, .minute ], from: sender.date)
            let hour = components.hour!
            let minute = components.minute!
            if minute < 10 && hour < 10{
                closeTime = "0\(hour):0\(minute)"
                
            }else if minute > 9 && hour > 9{
                closeTime = "\(hour):\(minute)"
                
            }else if minute < 10 && hour > 9{
                closeTime = "\(hour):0\(minute)"
                
            }else if minute > 9 && hour < 10{
                closeTime = "0\(hour):\(minute)"
            }
        }
    
    @IBAction func chooseDayBtn(_ sender: Any) {
        print("choose day")
//        let getWorkingTimeVC =  self.storyboard!.instantiateViewController(withIdentifier: "workingDays") as! SetWorkingDaysViewController
//        
//        self.present(getWorkingTimeVC, animated: false, completion: nil)
//        
        let popvc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "workingDays") as! SetWorkingDaysViewController
        
        self.addChild(popvc)
        
        popvc.view.frame = self.view.frame
        
        self.view.addSubview(popvc.view)
        
        popvc.didMove(toParent: self)
        
    }
}

