//
//  EnumSec.swift
//  VoiceReminder
//
//  Created by Daniil Litvinov on 05.05.2023.
//

import Foundation


final class SecondOfTimer {
    static let share = SecondOfTimer()
    enum SecondOfRecording: Int {
        case fiveSec = 5
        case tenSec = 10
        case tenFive = 15
        case twinty = 20
    }
    let secondTemer = DispatchTimeInterval.seconds(SecondOfRecording.tenSec.rawValue)
    
}

