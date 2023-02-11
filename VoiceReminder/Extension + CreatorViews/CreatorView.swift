//
//  CreatorView.swift
//  VoiceReminder
//
//  Created by Daniil Litvinov on 10.02.2023.
//

import UIKit

class CreatorViews {
   static func configureButton(title: String, color: UIColor) -> UIButton {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(title, for: .normal)
        button.backgroundColor = color
        button.layer.cornerRadius = 40
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 8, height: 8)
        button.layer.shadowRadius = 8
        button.layer.shadowOpacity = 0.4
        button.titleLabel?.numberOfLines = 5
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .heavy)
        button.tintColor = .white
        button.titleLabel?.textAlignment = .center
        return button
    }
}
