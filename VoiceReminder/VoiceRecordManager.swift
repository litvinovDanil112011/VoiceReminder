//
//  VoiceRecordManager.swift
//  VoiceReminder
//
//  Created by Daniil Litvinov on 10.02.2023.
//

import UIKit
import AVFoundation

class VoiceRecordManager {
    
   static var countVoice = 0
    
    var recordig: AVAudioSession = AVAudioSession.sharedInstance()
    var audioRecorder: AVAudioRecorder = AVAudioRecorder()
    
    func getDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = path[0]
        return documentsDirectory
    }
}
