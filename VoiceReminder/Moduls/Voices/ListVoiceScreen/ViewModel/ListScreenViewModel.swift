//
//  ListScreenViewModel.swift
//  VoiceReminder
//
//  Created by Daniil Litvinov on 03.05.2023.
//

import Foundation
import AVFAudio

protocol ListScreenViewModelProtocol {
    var audioPlayer: AVAudioPlayer { get set }
    func deleteAllVoice()
}

final class ListScreenViewModel: ListScreenViewModelProtocol {
    
    var audioPlayer: AVAudioPlayer = AVAudioPlayer()
    
    func deleteAllVoice() {
        ManagerCoreData.shared.deleteAll()
    }
}
