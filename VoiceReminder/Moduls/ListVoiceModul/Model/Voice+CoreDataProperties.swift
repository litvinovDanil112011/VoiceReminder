//
//  Voice+CoreDataProperties.swift
//  VoiceReminder
//
//  Created by Daniil Litvinov on 10.02.2023.
//
//

import Foundation
import CoreData


extension Voice {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Voice> {
        return NSFetchRequest<Voice>(entityName: "Voice")
    }

    @NSManaged public var voiceAT: Data?

}

extension Voice : Identifiable {

}
