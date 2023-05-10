//
//  SettingsViewModel.swift
//  VoiceReminder
//
//  Created by Daniil Litvinov on 10.05.2023.
//

import Foundation

protocol SettingsViewModelProtocol {
    var cellsSettings: [ModelCells] { get set }
}

class SettingsViewModel: SettingsViewModelProtocol {

    var cellsSettings: [ModelCells] = [
        ModelCells(cellType: .timeSetting, titleCell: "Время записи", image: nil),
        ModelCells(cellType: .notificationCell, titleCell: "Уведомления", image: nil)
    ]
    
}
