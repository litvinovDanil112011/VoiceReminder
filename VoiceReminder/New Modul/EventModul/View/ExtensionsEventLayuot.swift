//
//  ExtensionsEventLayuot.swift
//  VoiceReminder
//
//  Created by Daniil Litvinov on 12.02.2023.
//

import UIKit

extension EventsViewController {
    func setupLayuot() {
        NSLayoutConstraint.activate([
            titleEvent.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleEvent.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1 / 1.2),
            titleEvent.bottomAnchor.constraint(equalTo: addImageButton.topAnchor, constant: -15),
            titleEvent.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1 / 7),
            
            addImageButton.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -15),
            addImageButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1 / 1.2),
            addImageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addImageButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1 / 5),
            
            addVoiceButton.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 15),
            addVoiceButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1 / 1.2),
            addVoiceButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addVoiceButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1 / 5),
            
            saveEvent.topAnchor.constraint(equalTo: addVoiceButton.bottomAnchor, constant: 15),
            saveEvent.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1 / 1.2),
            saveEvent.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveEvent.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1 / 5)
            
        ])
    }
}

