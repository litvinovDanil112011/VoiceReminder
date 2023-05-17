//
//  SettingsViewModel.swift
//  VoiceReminder
//
//  Created by Daniil Litvinov on 10.05.2023.
//

import UIKit

protocol SettingsViewModelProtocol {
    var cellsSettings: [ModelCells] { get set }
    func timing(completions: @escaping() -> (Void)) -> UIAlertController
}

class SettingsViewModel: SettingsViewModelProtocol {
    
    func timing(completions: @escaping() -> (Void)) -> UIAlertController  {
        let actionsShetts = UIAlertController(title: "Выбирите время", message: "Время в секундах! Сейчас установлена время \(SecondOfTimer.share.second) секунд", preferredStyle: .actionSheet)
        actionsShetts.addAction(UIAlertAction(title: "5 sec", style: .default, handler: { _ in
            SecondOfTimer.share.second = 5
            SecondOfTimer.share.saveSecond()
        }))
        actionsShetts.addAction(UIAlertAction(title: "10 sec", style: .default, handler: { _ in
            SecondOfTimer.share.second = 10
            SecondOfTimer.share.saveSecond()
        }))
        actionsShetts.addAction(UIAlertAction(title: "15 sec", style: .default, handler: { _ in
            SecondOfTimer.share.second = 15
            SecondOfTimer.share.saveSecond()
        }))
        actionsShetts.addAction(UIAlertAction(title: "20 sec", style: .default, handler: { _ in
            SecondOfTimer.share.second = 20
            SecondOfTimer.share.saveSecond()
        }))
        actionsShetts.addAction(UIAlertAction(title: "Отмена", style: .cancel))
        completions()
        return actionsShetts
    }
    var cellsSettings: [ModelCells] = [
        ModelCells(cellType: .timeSetting, titleCell: "Время записи", image: nil),
        ModelCells(cellType: .notificationCell, titleCell: "Уведомления", image: nil)
    ]
    
}
