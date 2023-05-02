//
//  ManagerCoreData.swift
//  VoiceReminder
//
//  Created by Daniil Litvinov on 02.05.2023.
//

import Foundation
import CoreData

class ManagerCoreData {
    
    static let shared = ManagerCoreData()
    
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "VoiceReminder")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {

                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support
    lazy var context = persistentContainer.viewContext

    func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}
