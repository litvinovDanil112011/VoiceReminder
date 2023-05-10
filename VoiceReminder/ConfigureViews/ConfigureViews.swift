//
//  ConfigureViews.swift
//  VoiceReminder
//
//  Created by Daniil Litvinov on 02.05.2023.
//

import UIKit
 
final class ConfigureViews {
    
    static let share = ConfigureViews()
    
    func configureViewSpaser() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }
    
    func configureButton(_ title: String?, backgroundColor: UIColor, radius: CGFloat?, image: UIImage?) -> UIButton {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.setTitle(title, for: .normal)
        button.backgroundColor = backgroundColor
        button.layer.cornerRadius = radius ?? 10
        button.tintColor = .white
        button.setImage(image, for: .normal)
        button.clipsToBounds = true
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        button.titleLabel?.numberOfLines = 10
        button.titleLabel?.textAlignment = .center
        return button
    }
    
    func configureTable() -> UITableView {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }
    
    func configureLabel(title: String?) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = title
        return label
    }
    
    func configureSwitch() -> UISwitch {
        let switchMy = UISwitch()
        switchMy.translatesAutoresizingMaskIntoConstraints = false
        return switchMy
    }
    
}
