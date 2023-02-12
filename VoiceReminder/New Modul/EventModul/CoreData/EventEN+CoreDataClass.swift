//
//  EventEN+CoreDataClass.swift
//  VoiceReminder
//
//  Created by Daniil Litvinov on 12.02.2023.
//
//

import Foundation
import CoreData

@objc(EventEN)
public class EventEN: NSManagedObject {
    convenience init() {
        let coreData = CoreDataManager()
        self.init(entity: coreData.entityForName(entity: "EventEN"), insertInto: coreData.context)
    }
}
