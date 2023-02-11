//
//  Voice+CoreDataClass.swift
//  VoiceReminder
//
//  Created by Daniil Litvinov on 10.02.2023.
//
//

import Foundation
import CoreData

@objc(Voice)
public class Voice: NSManagedObject {
    convenience init() {
        let coreData = CoreDataManager()
        self.init(entity: coreData.entityForName(entity: "Voice"), insertInto: coreData.context)
    }
}
