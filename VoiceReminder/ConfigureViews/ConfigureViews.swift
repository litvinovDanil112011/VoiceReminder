//
//  ConfigureViews.swift
//  VoiceReminder
//
//  Created by Daniil Litvinov on 02.05.2023.
//

import UIKit
 
class ConfigureViews {
    
    static let share = ConfigureViews()
    
    func configureViewSpaser() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }
    
    func configureButton(_ title: String, backgroundColor: UIColor, radius: CGFloat?) -> UIButton {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.setTitle(title, for: .normal)
        button.backgroundColor = backgroundColor
        button.layer.cornerRadius = radius ?? 10
        return button
    }
    
    func configureTable() -> UITableView {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }
    
}
