//
//  ManagerCoreData.swift
//  VoiceReminder
//
//  Created by Daniil Litvinov on 02.05.2023.
//

import Foundation
import CoreData

final class ManagerCoreData {
    
    public static let shared = ManagerCoreData()
    private init() {}
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
    func feachVoice() -> [Voices] {
        var voices = [Voices]()
        let featchResult = NSFetchRequest<NSFetchRequestResult>(entityName: "Voices")
        do {
            voices = try context.fetch(featchResult) as? [Voices] ?? []
        } catch {
            print(error)
        }
        return voices
    }
    
    func deleteAll() {
        var voices = [Voices]()
        let featchResult = NSFetchRequest<NSFetchRequestResult>(entityName: "Voices")
        do {
            voices = try context.fetch(featchResult) as? [Voices] ?? []
            voices.forEach { context.delete($0) }
        } catch {
            print(error)
        }
    }
}
