//
//  Alert.swift
//  VoiceReminder
//
//  Created by Daniil Litvinov on 03.05.2023.
//

import Foundation
import UIKit

final class Alert {
    
    public static let share = Alert()
  
    func displayAlert(title: String, message: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        return alert
    }
}
