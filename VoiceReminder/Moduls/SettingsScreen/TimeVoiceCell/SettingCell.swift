//
//  SettingCell.swift
//  VoiceReminder
//
//  Created by Daniil Litvinov on 10.05.2023.
//

import UIKit

final class SettingCell: UITableViewCell {
    //MARK: var
    static let id = "SettingCell"
     lazy var titleCell = ConfigureViews.share.configureLabel(
        title: nil)
     lazy var buttonCell = ConfigureViews.share.configureButton(
        nil,
        backgroundColor: .blue,
        radius: nil,
        image: nil)
    //MARK: LifeCicle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
        setupLayuot()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: Func
    func configure(with title: String, titleButton: String) {
        titleCell.text = title
        buttonCell.setTitle(titleButton, for: .normal) 
    }
    
    
    //MARK: Setup
    private func setupCell() {
        contentView.addSubview(titleCell)
        contentView.addSubview(buttonCell)

    }
    
    private func setupLayuot() {
        NSLayoutConstraint.activate([
            titleCell.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleCell.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            
            buttonCell.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            buttonCell.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15),
        ])
    }
}
