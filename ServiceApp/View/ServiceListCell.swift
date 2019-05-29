//
//  ServiceListCell.swift
//  ServiceApp
//
//  Created by apple on 27/05/19.
//  Copyright © 2019 appsmall. All rights reserved.
//

import UIKit


class ServiceListCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var callButton: UIButton!
    
    var serviceList: ServiceList! {
        didSet {
            nameLabel.text = serviceList.name
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        callButton.layer.cornerRadius = callButton.frame.height / 2
        callButton.layer.masksToBounds = true
    }

}
