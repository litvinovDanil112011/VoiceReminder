//
//  NotificationCell.swift
//  VoiceReminder
//
//  Created by Daniil Litvinov on 10.05.2023.
//

import UIKit

class NotificationCell: UITableViewCell {
    //MARK: var
    static let id = "NotificationCell"
    private lazy var labelCell = ConfigureViews.share.configureLabel(title: nil)
    private lazy var notificationSwitchCell = ConfigureViews.share.configureSwitch()
    //MARK: life cicle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupLayuot()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: func
    func configure(with title: String) {
        labelCell.text = title
    }
    //MARK: setups
    private func setupView() {
        contentView.addSubview(labelCell)
        contentView.addSubview(notificationSwitchCell)
    }
    
    private func setupLayuot() {
        NSLayoutConstraint.activate([
            labelCell.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            labelCell.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            
            notificationSwitchCell.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15),
            notificationSwitchCell.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)

        ])
    }
    
    
}
