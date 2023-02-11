//
//  MainLayuot.swift
//  VoiceReminder
//
//  Created by Daniil Litvinov on 10.02.2023.
//

import UIKit

extension MainViewController {
    func setupLayuot() {
        NSLayoutConstraint.activate([
            voiceAddButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            voiceAddButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1 / 1.2),
            voiceAddButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1 / 5),
            voiceAddButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
            
            listVoiceButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            listVoiceButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1 / 1.2),
            listVoiceButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1 / 5),
            listVoiceButton.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 10)
        ])
    }
}
