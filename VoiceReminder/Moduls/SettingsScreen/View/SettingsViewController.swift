//
//  SettingsViewController.swift
//  VoiceReminder
//
//  Created by Daniil Litvinov on 06.05.2023.
//

import UIKit

final class SettingsViewController: UIViewController, UITableViewDataSource {
    //MARK: Var
    private lazy var settingsTable = ConfigureViews.share.configureTable()
    var viewModel: SettingsViewModelProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupTable()
        viewModel = SettingsViewModel()
    }
    
    private func setupViews() {
        title = "Настройки"
        settingsTable.frame = view.bounds
        view.addSubview(settingsTable)
    }
    
    private func setupTable() {
        settingsTable.delegate = self
        settingsTable.dataSource = self
        settingsTable.register(SettingCell.self, forCellReuseIdentifier: SettingCell.id)
        settingsTable.register(NotificationCell.self, forCellReuseIdentifier: NotificationCell.id)
    }
}

extension SettingsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.cellsSettings.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cells = viewModel?.cellsSettings[indexPath.row]
        switch cells?.cellType {
        case .timeSetting:
            guard let cell = settingsTable.dequeueReusableCell(withIdentifier: SettingCell.id, for: indexPath) as? SettingCell else { return UITableViewCell() }
            cell.configure(with: cells?.titleCell ?? "No data", timeSec: "\(SecondOfTimer.share.pushSecond()) Cекунд")
            return cell
        case .notificationCell:
            guard let cell = settingsTable.dequeueReusableCell(withIdentifier: NotificationCell.id, for: indexPath) as? NotificationCell else { return UITableViewCell() }
            cell.configure(with: cells?.titleCell ?? "No data")
            return cell
        case .none:
            return UITableViewCell()
        }
    }
    
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            settingsTable.deselectRow(at: indexPath, animated: true)
            let cells = viewModel?.cellsSettings[indexPath.row]
            switch cells?.cellType {
            case .timeSetting:
                present(viewModel?.timing(completions: { [ weak self ] in
                    self?.settingsTable.reloadData()
                }) ?? UIViewController(), animated: true)
            case .notificationCell:
                print("\(SecondOfTimer.share.second)")
            case .none:
                let alert = Alert.share.displayAlert(title: "UPS", message: "Перейти по ячейки нельзя")
                present(alert, animated: true)
            }
            settingsTable.reloadData()
        }
        
    }

