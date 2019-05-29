//
//  SignupVC.swift
//  ServiceApp
//
//  Created by apple on 25/05/19.
//  Copyright © 2019 appsmall. All rights reserved.
//

import UIKit
import CommonCrypto
import CryptoSwift

class SignupVC: UIViewController {
    
    struct Storyboard {
        static let signupVCToHomeVC = "signupVCToHomeVC"
    }

    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var phoneView: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var user: User?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.perform(#selector(updateUI), with: nil, afterDelay: 0.0)
    }
    
    @objc func updateUI() {
        nameView.cornerRadius()
        phoneView.cornerRadius()
        passwordView.cornerRadius()
        signupButton.cornerRadius()
    }
    
    
    // MARK:- IBACTIONS
    @IBAction func signupBtnPressed(_ sender: UIButton) {
        ActivityIndicator.shared().show()
        
        if let name = nameTextField.text, let phone = phoneTextField.text, let password = passwordTextField.text {
            if name == emptyString {
                 // Please check email address
                ActivityIndicator.shared().hide()
                self.alert(message: "Please fill the name.")
            }
            else {
                if phone == emptyString && !phone.isValidPhone() {
                    ActivityIndicator.shared().hide()
                    self.alert(message: "Please fill the phone number correctly.")
                }
                else {
                    if password == emptyString && !password.isPasswordLength() {
                        ActivityIndicator.shared().hide()
                        self.alert(message: "Please set the password with minimum 6 characters long.")
                    }
                    else {
                        if let _ = Service.getUsers(phone: phone) {
                            ActivityIndicator.shared().hide()
                            self.alert(message: "User already with the same phone number")
                        }
                        else {
                            // Save user details into local database
                            user = User(context: PersistenceService.context)
                            let id = UUID().uuidString
                            user?.id = id
                            user?.name = name
                            user?.phone = phone
                            user?.password = password.sha256()
                            
                            PersistenceService.saveContext()
                            
                            let userInfo = ["name":name, "id": id, "phone": phone]
                            UserDefaults.standard.set(userInfo, forKey: "UserInfo")
                            
                            ActivityIndicator.shared().hide()
                            self.performSegue(withIdentifier: Storyboard.signupVCToHomeVC, sender: nil)
                        }
                    }
                }
            }
        }
    }
    
    @IBAction func backToLoginBtnPressed(_ sender: UIButton) {
        _ = self.navigationController?.popViewController(animated: true)
    }
}


extension SignupVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func clearTextFields() {
        nameTextField.text = emptyString
        phoneTextField.text = emptyString
        passwordTextField.text = emptyString
    }
}
