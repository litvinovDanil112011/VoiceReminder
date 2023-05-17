//
//  SecondOfTimer.swift
//  VoiceReminder
//
//  Created by Daniil Litvinov on 05.05.2023.
//

import Foundation


final class SecondOfTimer {
    
    static let share = SecondOfTimer()
    
    var second = 5
    
    func saveSecond() {
        UserDefaults.standard.set(second, forKey: "second")
    }
    
    func pushSecond() -> Int {
        let second = UserDefaults.standard.object(forKey: "second")
        return second as? Int ?? 0
    }
    
    func getSecind(sec: Int) -> DispatchTimeInterval {
        let secondTemer = DispatchTimeInterval.seconds(sec)
        return secondTemer
    }
    
    func getSecStr(sec: Int) -> String {
        let secStr = String(sec)
        return secStr
    }
}

