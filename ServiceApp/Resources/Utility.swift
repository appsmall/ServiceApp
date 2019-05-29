//
//  Utility.swift
//  ServiceApp
//
//  Created by apple on 27/05/19.
//  Copyright © 2019 appsmall. All rights reserved.
//

import UIKit
import CryptoSwift

class EncryptionDecryption {
    
    static func encrypt(password: String) -> String {
        let encryptedPassword = password.sha256()
        return encryptedPassword
    }
    
}
