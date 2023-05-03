//
//  Alert.swift
//  VoiceReminder
//
//  Created by Daniil Litvinov on 03.05.2023.
//

import Foundation
import UIKit

class Alert: UIViewController {
    
    static let share = Alert()
    
    func displayAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "dismiss", style: .default))
        present(alert, animated: false)
    }
}
