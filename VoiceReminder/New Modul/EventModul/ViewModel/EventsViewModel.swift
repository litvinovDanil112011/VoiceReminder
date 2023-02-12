//
//  EventsViewModel.swift
//  VoiceReminder
//
//  Created by Daniil Litvinov on 12.02.2023.
//

import UIKit
import CoreData
import AVFoundation

protocol EventsViewModelProtocol {
    func saveEvent()
    func voiceOfRecording(completion: @escaping () -> Void)
    var recorder: AVAudioSession { get set }
    var aiduoRecorder: AVAudioRecorder { get set }
    var isRecorder: Bool { get set }
    func saveNumbers()
}

class EventsViewModel: EventsViewModelProtocol {
    
    var voiceManager = EventVoiceManager()
    
    func voiceOfRecording(completion: @escaping () -> Void) {
        UserDefaults.standard.set(EventVoiceManager.countNameVoice, forKey: "numberVoiceEvent")
        let fileName = voiceManager.getDirectory().appendingPathComponent("\(EventVoiceManager.countNameVoice).m4a")
        let setting = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 1200,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        do {
            aiduoRecorder = try AVAudioRecorder(url: fileName, settings: setting)
            if isRecorder == true {
                aiduoRecorder.record()
            } else {
                aiduoRecorder.stop()
            }
        }
        catch
        {
            print("Запись не началась")
        }
        completion()
    }
    
    var isRecorder: Bool = false
    var recorder: AVAudioSession = AVAudioSession.sharedInstance()
    var aiduoRecorder: AVAudioRecorder = AVAudioRecorder()
    
    func saveEvent() {
        print(" ")
    }
    func saveNumbers() {
        if let numbers = UserDefaults.standard.object(forKey: "numberVoiceEvent") as? Int {
            VoiceRecordManager.countVoice = numbers
        }
        
    }
}



