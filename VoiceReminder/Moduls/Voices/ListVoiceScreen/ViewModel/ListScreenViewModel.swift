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
}

class ListScreenViewModel: ListScreenViewModelProtocol {
    
    var audioPlayer: AVAudioPlayer = AVAudioPlayer()
    
}
