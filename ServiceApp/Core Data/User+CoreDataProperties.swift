//
//  User+CoreDataProperties.swift
//  ServiceApp
//
//  Created by apple on 27/05/19.
//  Copyright © 2019 appsmall. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: String?
    @NSManaged public var phone: String?
    @NSManaged public var password: String?

}
