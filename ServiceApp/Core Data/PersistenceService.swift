//
//  PersistenceService.swift
//  ServiceApp
//
//  Created by apple on 27/05/19.
//  Copyright © 2019 appsmall. All rights reserved.
//

import Foundation
import CoreData


// MARK:- USED FOR OFFLINE DATABASE
class PersistenceService {
    
    private init() {}
    
    static var context: NSManagedObjectContext{
        return persistentContainer.viewContext
    }
    
    
    
    // MARK: - Core Data stack
    @available(iOS 10.0, *)
    static var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "Service")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    
    // MARK: - Core Data Saving support
    static func saveContext () {
        if #available(iOS 10.0, *) {
            let context = persistentContainer.viewContext
            if context.hasChanges {
                do {
                    try context.save()
                } catch {
                    // Replace this implementation with code to handle the error appropriately.
                    // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    let nserror = error as NSError
                    fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
                }
            }
        } else {
            // Fallback on earlier versions
            
        }
    }
    
    /*
     METHOD DESC:- DELETE OBJECT FROM OFFLINE DATABASE ON THE BASIS OF QUIZ-ID
     */
    /*static func deleteObjectFromOfflineDatabase(quizId: String) {
        if let quizzes = Utility.getOfflineQuizzes() {
            
            for quiz in quizzes {
                if let offlineQuizId = quiz.id {
                    if offlineQuizId == quizId {
                        print("Quiz Id Matched and delete")
                        context.delete(quiz)
                        saveContext()
                        break
                    }
                    else {
                        // Quiz Id not matched, then do nothing
                        print("Quiz Id not matched")
                    }
                }
                else {
                    // When quizId doesn't exist in the offlineQuiz
                    print("Quiz Id not exist in offline database")
                }
            }
        }
    }
    
    /*
     METHOD DESC:- DELETE ALL THE OBJECT FROM OFFLINE DATABASE
     */
    static func deleteAllObjects() {
        if let quizzes = Utility.getOfflineQuizzes() {
            for quiz in quizzes {
                context.delete(quiz)
            }
            saveContext()
        }
    }*/
    
}
