//
//  ManagerVoice.swift
//  VoiceReminder
//
//  Created by Daniil Litvinov on 02.05.2023.
//

import Foundation
import AVFoundation

final class ManagerVoiceRec {
    
  public static let share = ManagerVoiceRec()
    private init() {}
    func getDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = path[0]
        return documentsDirectory
    }
}
