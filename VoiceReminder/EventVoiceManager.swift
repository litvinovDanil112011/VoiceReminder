//
//  EventVoiceManager.swift
//  VoiceReminder
//
//  Created by Daniil Litvinov on 12.02.2023.
//

import AVFoundation
import UIKit

class EventVoiceManager {
    
   static var countNameVoice = 0
    
    var recordig: AVAudioSession = AVAudioSession.sharedInstance()
    var audioRecorder: AVAudioRecorder = AVAudioRecorder()
    
    func getDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = path[0]
        return documentsDirectory
    }
}
