//
//  SetWorkingDaysViewController.swift
//  ChefApp
//
//  Created by Admin on 9/29/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class SetWorkingDaysViewController: UIViewController {

    
    @IBOutlet weak var wednesdayBtn: ButtonCornerRadious!
    @IBOutlet weak var continueBtn: ButtonCornerRadious!
    @IBOutlet weak var fridayBtn: ButtonCornerRadious!
    @IBOutlet weak var thursdayBtn: ButtonCornerRadious!
    @IBOutlet weak var tuesdayBtn: ButtonCornerRadious!
    @IBOutlet weak var mondayBtn: ButtonCornerRadious!
    @IBOutlet weak var sunDayBtn: ButtonCornerRadious!
    @IBOutlet weak var SaturdayBtn: ButtonCornerRadious!
    override func viewDidLoad() {
        super.viewDidLoad()
        Localize()
        
    }
    
    @IBAction func dayBtnAction(_ sender: UIButton) {
        let btnId = sender.tag
        viewModel(dayId: btnId)
        
    }
    
    @IBAction func continuBtn(_ sender: Any) {
    }
    func Localize(){
        continueBtn.setTitle("Continue".localize, for: .normal)
        SaturdayBtn.setTitle("Satareday".localize, for: .normal)
        sunDayBtn.setTitle("Sunday".localize, for: .normal)
        mondayBtn.setTitle("Monday".localize, for: .normal)
        tuesdayBtn.setTitle("Tuesday".localize, for: .normal)
        wednesdayBtn.setTitle("Wensday".localize, for: .normal)
        thursdayBtn.setTitle("Thirsday".localize, for: .normal)
        fridayBtn.setTitle("Friday".localize, for: .normal)
        
    }
    func viewModel(dayId : Int) {
        let setWorkingTimeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "setWorkingTimeVC") as! setWorkingTimeViewController
        setWorkingTimeVC.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        setWorkingTimeVC.dayId = dayId
        self.present(setWorkingTimeVC, animated: true)
    }
}



