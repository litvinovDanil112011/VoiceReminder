//
//  ManagerVoice.swift
//  VoiceReminder
//
//  Created by Daniil Litvinov on 02.05.2023.
//

import Foundation
import AVFoundation

class ManagerVoiceRec {
    
   static let share = ManagerVoiceRec()
        
//    var recordig: AVAudioSession = AVAudioSession.sharedInstance()
//    var audioRecorder: AVAudioRecorder = AVAudioRecorder()
    
    func getDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = path[0]
        return documentsDirectory
    }
}
