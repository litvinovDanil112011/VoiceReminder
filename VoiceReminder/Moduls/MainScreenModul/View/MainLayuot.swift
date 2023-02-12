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
            listEventButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            listEventButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1 / 1.2),
            listEventButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1 / 5),
            listEventButton.bottomAnchor.constraint(equalTo: listVoiceButton.topAnchor, constant: -10),
            
            voiceAddButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            voiceAddButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1 / 1.2),
            voiceAddButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1 / 5),
            voiceAddButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
            
            eventAddButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            eventAddButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1 / 1.2),
            eventAddButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1 / 5),
            eventAddButton.bottomAnchor.constraint(equalTo: voiceAddButton.topAnchor, constant: -20),
            
            listVoiceButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            listVoiceButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1 / 1.2),
            listVoiceButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1 / 5),
            listVoiceButton.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -10)
        ])
    }
}
