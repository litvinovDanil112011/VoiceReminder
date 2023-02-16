//
//  CalendarLayuot.swift
//  VoiceReminder
//
//  Created by Daniil Litvinov on 16.02.2023.
//

import UIKit

extension CalendarViewController {
    func setupLayuot() {
       NSLayoutConstraint.activate([
           calendar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
           calendar.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1 / 1.25),
           calendar.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 1 / 15),
           calendar.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1 / 2)
       ])
   }
}
