//
//  Service.swift
//  ServiceApp
//
//  Created by apple on 27/05/19.
//  Copyright © 2019 appsmall. All rights reserved.
//

import UIKit
import CoreData

class Service {
    
    static func getUsers(phone: String) -> User? {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "phone == %@", phone)
        
        do {
            let users = try PersistenceService.context.fetch(fetchRequest)
            
            return users.first
        }
        catch {
            print("Error while fetching offline quizzes.")
            return nil
        }
    }
    
}
