//
//  Voices+CoreDataProperties.swift
//  VoiceReminder
//
//  Created by Daniil Litvinov on 02.05.2023.
//
//

import Foundation
import CoreData

@objc(Voices)
public class Voices: NSManagedObject {
}

extension Voices {
    @NSManaged public var voice: Data?
    @NSManaged public var date: String?
}

extension Voices : Identifiable {
}
