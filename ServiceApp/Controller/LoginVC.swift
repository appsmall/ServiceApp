//
//  LoginVC.swift
//  ServiceApp
//
//  Created by apple on 25/05/19.
//  Copyright © 2019 appsmall. All rights reserved.
//

import UIKit
import CryptoSwift

class LoginVC: UIViewController {
    
    struct Storyboard {
        static let loginVCToSignupVC = "loginVCToSignupVC"
        static let loginVCToHomeVC = "loginVCToHomeVC"
    }

    @IBOutlet weak var phoneView: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.perform(#selector(updateUI), with: nil, afterDelay: 0.0)
    }
    
    @objc func updateUI() {
        phoneView.cornerRadius()
        passwordView.cornerRadius()
        loginButton.cornerRadius()
    }
    
    
    // MARK:- IBACTIONS
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        if let phone = phoneTextField.text, let password = passwordTextField.text {
            if phone == emptyString && !phone.isValidPhone() {
                ActivityIndicator.shared().hide()
                self.alert(message: "Please fill the email address correctly.")
            }
            else {
                if password == emptyString && !password.isPasswordLength() {
                    ActivityIndicator.shared().hide()
                    self.alert(message: "Please set the password with minimum 6 characters long.")
                }
                else {
                    // check user details from local database
                    ActivityIndicator.shared().hide()
                    
                    if let user = Service.getUsers(phone: phone) {
                        if user.phone == phone && user.password == password.sha256() {
                            let userInfo = ["name":user.name, "id": user.id, "phone": user.phone]
                            UserDefaults.standard.set(userInfo, forKey: "UserInfo")
                            self.performSegue(withIdentifier: Storyboard.loginVCToHomeVC, sender: nil)
                        }
                        else {
                            self.alert(message: "Please enter your correct password.")
                        }
                    }
                    else {
                        self.alert(message: "No user record present with this phone number.")
                    }
                    
                }
            }
        }
    }
    
    @IBAction func skipToHomeScreenBtnPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: Storyboard.loginVCToHomeVC, sender: nil)
    }
    
    @IBAction func createNewAccountBtnPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: Storyboard.loginVCToSignupVC, sender: nil)
    }

}
