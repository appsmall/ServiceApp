//
//  ServiceListVC.swift
//  ServiceApp
//
//  Created by apple on 27/05/19.
//  Copyright © 2019 appsmall. All rights reserved.
//

import UIKit

enum ServiceCategory: String {
    case drycleaning
    case cleaning
    case laundary
}

struct ServiceList {
    let name: String
    let phone: String
    let category: ServiceCategory
}

class ServiceListVC: UIViewController {
    struct Storyboard {
        static let kCellId = "ServiceListCell"
    }

    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var serviceListTableView: UITableView!
    
    var services: [ServiceList]?
    var categoryName = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryLabel.text = categoryName.capitalized
    }
    

    @IBAction func backBtnPressed(_ sender: UIButton) {
        _ = self.navigationController?.popViewController(animated: true)
    }
}

extension ServiceListVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let services = services {
            return services.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.kCellId, for: indexPath) as! ServiceListCell
        if let services = services {
            let serviceList = services[indexPath.row]
            cell.serviceList = serviceList
            cell.callButton.tag = indexPath.row
            cell.callButton.addTarget(self, action: #selector(callBtnTapped), for: .touchUpInside)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    @objc func callBtnTapped(button: UIButton) {
        if let services = services {
            let serviceList = services[button.tag]
            let phoneNumber = serviceList.phone
            
            if let url = URL(string: "tel://\(phoneNumber)"), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }
    }
}
