//
//  Extension.swift
//  ServiceApp
//
//  Created by apple on 25/05/19.
//  Copyright © 2019 appsmall. All rights reserved.
//

import UIKit


extension UIView {
    func cornerRadius() {
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.masksToBounds = true
    }
}

extension String {
    // EMAIL VALIDATION
    func isValidPhone() -> Bool {
        if self.count >= 10 {
            return true
        }else{
            return false
        }
    }
    
    // PASSWORD VALIDATION
    func isPasswordLength() -> Bool {
        if self.count >= 6 {
            return true
        }else{
            return false
        }
    }
}

extension UIViewController {
    func alert(title: String? = nil, message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}
