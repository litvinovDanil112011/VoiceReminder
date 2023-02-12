//
//  EventEN+CoreDataProperties.swift
//  VoiceReminder
//
//  Created by Daniil Litvinov on 12.02.2023.
//
//

import Foundation
import CoreData


extension EventEN {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EventEN> {
        return NSFetchRequest<EventEN>(entityName: "EventEN")
    }

    @NSManaged public var imageAT: Data?
    @NSManaged public var titleAT: String?
    @NSManaged public var voiceAT: Data?

}

extension EventEN : Identifiable {

}
