//
//  ListVoiceViewController.swift
//  VoiceReminder
//
//  Created by Daniil Litvinov on 02.05.2023.
//

import UIKit
import AVFAudio

final class ListVoiceViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    //MARK: Var
    private lazy var listTable = ConfigureViews.share.configureTable()
    var voices = [Voices]()
    var viewModel: ListScreenViewModelProtocol?
    //MARK: Life cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupLayuot()
        setupTable()
        viewModel = ListScreenViewModel()
        setupBarItems()
    }
    override func viewWillAppear(_ animated: Bool) {
        voices = ManagerCoreData.shared.feachVoice()
        listTable.reloadData()
    }
    //MARK: setupBarItems
    private func setupBarItems() {
        let settingScreen = UIBarButtonItem(systemItem: .edit)
        navigationItem.rightBarButtonItem = settingScreen
        settingScreen.tintColor = .black
        settingScreen.backgroundImage(for: .normal, barMetrics: .compact)
        settingScreen.menu = addMenu()
    }
    //MENU setting
    private func addMenu() -> UIMenu {
        let menuItems = UIMenu(title: "", children: [
            UIAction(title: "Удалить все голосовые напоминание", image: UIImage(systemName: "trash.fill"), handler:
                        { [ weak self ] _ in
                            if self!.voices.isEmpty {
                                let alert = Alert.share.displayAlert(title: "UPS", message: "Голосовых напоминаний нет")
                                self?.present(alert, animated: true)
                            } else {
                                let actionsSheets = UIAlertController(title: "Уверены что хотите удалить все голосовые?", message: "Все голосовые напоминание будут безвозвратно удалены", preferredStyle: .actionSheet)
                                actionsSheets.addAction(UIAlertAction(title: "Удалить все", style: .default, handler: { _ in
                                    self?.navigationController?.popViewController(animated: true)
                                    self?.viewModel?.deleteAllVoice()
                                }))
                                actionsSheets.addAction(UIAlertAction(title: "Отмена", style: .cancel))
                                self?.present(actionsSheets, animated: true)
                            }
                        }),
            UIAction(title: "Удалить выбранные", image: UIImage(systemName: "trash"), handler: { _ in
                self.dismiss(animated: false, completion: {
                    let alert = Alert.share.displayAlert(title: "Кнопка в разработке", message: "Не забудь её сделать, она очень важна")
                    self.present(alert, animated: true)
                })
            }),
            //суда добалять новые настройки
//            UIAction(title: "Удалить выбранные", image: UIImage(systemName: "trash"), handler: { _ in
//                self.dismiss(animated: false, completion: {
//                    let alert = Alert.share.displayAlert(title: "Test", message: "test")
//                    self.present(alert, animated: true)
//                })
//            }),
        ])
        ManagerCoreData.shared.saveContext()
        return menuItems
    }
    
    //MARK: setupTable
    private func setupTable() {
        listTable.dataSource = self
        listTable.delegate = self
        listTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    //MARK: setupViews
    private func setupViews() {
        title = "Список Голосовых Напоминаний"
        view.addSubview(listTable)
    }
    //MARK: setupLayuot
    private func setupLayuot() {
        listTable.frame = view.bounds
    }
    
}
extension ListVoiceViewController {
    //MARK: table extension
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        voices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let dateName = voices[indexPath.row]
        cell.textLabel?.text = dateName.date
        cell.textLabel?.textAlignment = .natural
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        listTable.deselectRow(at: indexPath, animated: true)
        guard let fileName = voices[indexPath.row].date else { return }
        let path = ManagerVoiceRec.share.getDirectory().appendingPathComponent("\(fileName).m4a")
        do {
            viewModel?.audioPlayer = try AVAudioPlayer(contentsOf: path)
            viewModel?.audioPlayer.play()
        } catch {
            let alert = Alert.share.displayAlert(title: "UPS", message: "Не получилось проиграть запись")
            present(alert, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            ManagerCoreData.shared.context.delete(voices[indexPath.row])
            listTable.beginUpdates()
            voices.remove(at: indexPath.row)
            listTable.deleteRows(at: [indexPath], with: .bottom)
            listTable.endUpdates()
        }
        ManagerCoreData.shared.saveContext()
    }
}

