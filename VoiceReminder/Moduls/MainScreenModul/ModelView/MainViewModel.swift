//
//  MainViewModel.swift
//  VoiceReminder
//
//  Created by Daniil Litvinov on 10.02.2023.
//

import Foundation
import AVFoundation

protocol MainScreenProtocol {
    var recorder: AVAudioSession { get set }
    var aiduoRecorder: AVAudioRecorder { get set }
    func voiceSave()
    func startRecording(completion: @escaping () -> Void)
    func saveNumbers()
}

final class MainViewModel: MainScreenProtocol {
    
    var aiduoRecorder: AVAudioRecorder = AVAudioRecorder()
    var recorder: AVAudioSession = AVAudioSession.sharedInstance()
    var coreData = CoreDataManager()
    var voiceManager = VoiceRecordManager()

    func startRecording(completion: @escaping () -> Void) {
        UserDefaults.standard.set(VoiceRecordManager.countVoice, forKey: "numberVoice")
        let fileName = voiceManager.getDirectory().appendingPathComponent("\(VoiceRecordManager.countVoice).m4a")
        let setting = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 1200,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        do {
            aiduoRecorder = try AVAudioRecorder(url: fileName, settings: setting)
            aiduoRecorder.record()
            completion()
        }
        catch
        {
            print("Запись не началась")
        }
    }

    func saveNumbers() {
        if let numbers = UserDefaults.standard.object(forKey: "numberVoice") as? Int {
            VoiceRecordManager.countVoice = numbers
        }
    }
    
    func voiceSave() {
        let managerObject = Voice()
        managerObject.voiceAT = Data()
        coreData.saveContext()
    }
}

