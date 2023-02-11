//
//  CoreDataManager.swift
//  VoiceReminder
//
//  Created by Daniil Litvinov on 10.02.2023.
//

import Foundation
import CoreData

class CoreDataManager {
    
    init() {}
    
    lazy var context: NSManagedObjectContext = {
        persistentContainer.viewContext
    }()
    
    func entityForName(entity: String) -> NSEntityDescription {
        return NSEntityDescription.entity(forEntityName: entity, in: context) ?? NSEntityDescription()
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "VoiceReminder")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func saveContext () {
        let context = persistentContainer.viewContext
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
