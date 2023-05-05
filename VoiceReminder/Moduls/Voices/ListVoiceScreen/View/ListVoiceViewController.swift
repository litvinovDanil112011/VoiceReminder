//
//  ListVoiceViewController.swift
//  VoiceReminder
//
//  Created by Daniil Litvinov on 02.05.2023.
//

import UIKit
import AVFAudio

class ListVoiceViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        voices = ManagerCoreData.shared.feachVoice()
        listTable.reloadData()
    }
    
    private func setupTable() {
        listTable.dataSource = self
        listTable.delegate = self
        listTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    private func setupViews() {
        title = "Список Голосовых Напоминаний"
        view.addSubview(listTable)
    }
    
    private func setupLayuot() {
        listTable.frame = view.bounds
    }
}
extension ListVoiceViewController {
    //MARK: table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        voices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let dateName = voices[indexPath.row]
        cell.textLabel?.text = dateName.date
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
            Alert.share.displayAlert(title: "UPS", message: "Не проигрываеться")
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

