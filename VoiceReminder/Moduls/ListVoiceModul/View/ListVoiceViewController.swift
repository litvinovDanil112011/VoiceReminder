//
//  ListVoiceViewController.swift
//  VoiceReminder
//
//  Created by Daniil Litvinov on 11.02.2023.
//

import UIKit
import AVFoundation

final class ListVoiceViewController: UIViewController {
    
    var voiceManager = VoiceRecordManager()
    var audioPlayer: AVAudioPlayer = AVAudioPlayer()
    
    //MARK: Variabes
    private lazy var voiceTable: UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.dataSource = self
        table.delegate = self
        table.reloadData()
        return table
    }()
    //MARK: Life cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHerarchy()
        setupLayuot()
    }
    private func setupHerarchy() {
        view.addSubview(voiceTable)
    }
    
    private func setupLayuot() {
        title = "Список голосовых напоминаний"
        NSLayoutConstraint.activate([
            voiceTable.topAnchor.constraint(equalTo: view.topAnchor),
            voiceTable.leftAnchor.constraint(equalTo: view.leftAnchor),
            voiceTable.rightAnchor.constraint(equalTo: view.rightAnchor),
            voiceTable.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ListVoiceViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return VoiceRecordManager.countVoice
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = voiceTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = String("\(indexPath.row + 1)") + " Голосовое напоминание"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let path = voiceManager.getDirectory().appendingPathComponent("\(indexPath.row + 1).m4a")
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: path)
            audioPlayer.play()
        }
        catch {
            print(error)
        }
    }
}
