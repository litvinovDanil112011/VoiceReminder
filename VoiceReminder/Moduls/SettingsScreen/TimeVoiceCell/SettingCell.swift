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
    lazy var seconfTitle = ConfigureViews.share.configureLabel(title: nil)
    
    //MARK: LifeCicle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
        setupLayuot()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func pushTimeList() {
        print("pushTimeList")
    }
    //MARK: Func
    func configure(with title: String, timeSec: String) {
        titleCell.text = title
        seconfTitle.text = timeSec
    }
    
    //MARK: Setup
    private func setupCell() {
        contentView.addSubview(titleCell)
        contentView.addSubview(seconfTitle)
    }
    
    private func setupLayuot() {
        NSLayoutConstraint.activate([
            titleCell.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleCell.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            
            seconfTitle.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            seconfTitle.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15)
        ])
    }
}
