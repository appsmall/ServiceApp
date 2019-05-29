//
//  HomeVC.swift
//  ServiceApp
//
//  Created by apple on 25/05/19.
//  Copyright © 2019 appsmall. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    struct Storyboard {
        static let homeVCToServiceListVC = "homeVCToServiceListVC"
    }

    let services = [ServiceList(name: "Akshay Sharma", phone: "1234567890", category: .laundary),
                    ServiceList(name: "Ranjan Chopra", phone: "1234567890", category: .cleaning),
                    ServiceList(name: "Aman Saxena", phone: "1234567890", category: .cleaning),
                    ServiceList(name: "Bhavam Gupta", phone: "1234567890", category: .drycleaning),
                    ServiceList(name: "Ranjan Kumar", phone: "1234567890", category: .drycleaning),
                    ServiceList(name: "Steven Corey", phone: "1234567890", category: .drycleaning),
                    ServiceList(name: "Ranjana Kumar", phone: "1234567890", category: .drycleaning),
                    ServiceList(name: "Prem Kumar", phone: "1234567890", category: .drycleaning),
                    ServiceList(name: "L. Pallanswamy", phone: "1234567890", category: .drycleaning),
                    ServiceList(name: "Jose Boom", phone: "1234567890", category: .drycleaning),
                    ServiceList(name: "Bhavam Gupta", phone: "1234567890", category: .cleaning),
                    ServiceList(name: "Ranjan Kumar", phone: "1234567890", category: .cleaning),
                    ServiceList(name: "Steven Corey", phone: "1234567890", category: .cleaning),
                    ServiceList(name: "Ranjana Kumar", phone: "1234567890", category: .cleaning),
                    ServiceList(name: "Prem Kumar", phone: "1234567890", category: .cleaning),
                    ServiceList(name: "L. Pallanswamy", phone: "1234567890", category: .cleaning),
                    ServiceList(name: "Jose Boom", phone: "1234567890", category: .laundary),
                    ServiceList(name: "Bhavam Gupta", phone: "1234567890", category: .laundary),
                    ServiceList(name: "Ranjan Kumar", phone: "1234567890", category: .laundary),
                    ServiceList(name: "Steven Corey", phone: "1234567890", category: .laundary),
                    ServiceList(name: "Ranjana Kumar", phone: "1234567890", category: .laundary),
                    ServiceList(name: "Prem Kumar", phone: "1234567890", category: .laundary),
                    ServiceList(name: "L. Pallanswamy", phone: "1234567890", category: .laundary),
                    ServiceList(name: "Jose Boom", phone: "1234567890", category: .laundary),
                    ServiceList(name: "Ranjan Kumar", phone: "1234567890", category: .drycleaning)]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logoutBtnPressed(_ sender: UIButton) {
        UserDefaults.standard.removeObject(forKey: "UserInfo")
        _ = self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func serviceBtnPressed(_ sender: UITapGestureRecognizer) {
        if sender.view!.tag == 0 {
            // Cleaning
            let data = services.filter({$0.category == .cleaning})
            let serviceDict = ["category": "Cleaning", "services": data] as [String : Any]
            self.performSegue(withIdentifier: Storyboard.homeVCToServiceListVC, sender: serviceDict)
        }
        else if sender.view!.tag == 1 {
            // Dry-Cleaning
            let data = services.filter({$0.category == .drycleaning})
            let serviceDict = ["category": "Dry Cleaning", "services": data] as [String : Any]
            self.performSegue(withIdentifier: Storyboard.homeVCToServiceListVC, sender: serviceDict)
        }
        else {
            // Laundary
            let data = services.filter({$0.category == .laundary})
            let serviceDict = ["category": "Laundary", "services": data] as [String : Any]
            self.performSegue(withIdentifier: Storyboard.homeVCToServiceListVC, sender: serviceDict)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Storyboard.homeVCToServiceListVC {
            if let destination = segue.destination as? ServiceListVC {
                if let serviceDict = sender as? [String:Any] {
                    if let category = serviceDict["category"] as? String {
                        destination.categoryName = category
                    }
                    if let data = serviceDict["services"] as? [ServiceList] {
                        destination.services = data
                    }
                }
            }
        }
    }
    
}
