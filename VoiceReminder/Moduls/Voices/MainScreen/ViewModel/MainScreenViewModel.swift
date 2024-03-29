//
//  MainScreenViewModel.swift
//  VoiceReminder
//
//  Created by Daniil Litvinov on 02.05.2023.
//

import Foundation
import AVFoundation

protocol MainScreenViewModelProtocol {
    var session: AVAudioSession { get set }
    var recording: AVAudioRecorder { get set }
    func startRecord(completion: @escaping() ->(Void))
    func getNameFile() -> String
    func startTimer()
    var second: Int { get set }
}

final class MainScreenViewModel: MainScreenViewModelProtocol {
    
    var session: AVAudioSession = AVAudioSession()
    var recording: AVAudioRecorder = AVAudioRecorder()
    var timer = Timer()
    var second = SecondOfTimer.share.getSeconds()
    
    func startRecord(completion: @escaping () -> (Void)) {
        let currentDate = getNameFile()
        let newDate = Voices(context: ManagerCoreData.shared.context)
        newDate.voice = Data()
        newDate.date = currentDate
        print(currentDate)
        let fileName = ManagerVoiceRec.share.getDirectory().appendingPathComponent("\(currentDate).m4a")
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 1200,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        do {
            recording = try AVAudioRecorder(url: fileName, settings: settings)
            recording.record()
            completion()
            DispatchQueue.main.asyncAfter(deadline: .now() + SecondOfTimer.share.getSecind(sec: second)) {
                self.recording.stop()
                ManagerCoreData.shared.saveContext()
            }
        } catch {
            print(error)
        }
    }
    
    func getNameFile() -> String {
        let currentDate = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.weekday], from: currentDate)
        let weekDay = components.weekday
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd.MM.yyyy HH:mm:ss"
        let dateResult = dateFormater.string(from: currentDate)
        var day = String()
        switch weekDay {
        case 1:
            day = "воскресенье"
        case 2:
            day = "понедельник"
        case 3:
            day = "вторник"
        case 4:
            day = "среда"
        case 5:
            day = "четверг"
        case 6:
            day = "пятница"
        case 7:
            day = "суббота"
        default:
            day = "NO DAY"
        }
        let date = "\(day) \(dateResult)"
        return date
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerActions), userInfo: nil, repeats: true)
    }
    
    @objc func timerActions() {
        second -= 1
        print("\(second)")
        if second <= 0 {
            timer.invalidate()
        }
    }
}
