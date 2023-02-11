//
//  MainViewController.swift
//  VoiceReminder
//
//  Created by Daniil Litvinov on 10.02.2023.
//

import UIKit
import AVFoundation
import CoreData

final class MainViewController: UIViewController {
    
    var viewModel: MainScreenProtocol?
    var coreData = CoreDataManager()
    var voiceManager = VoiceRecordManager()
    
    //MARK: Varibes
    let voiceAddButton = CreatorViews.configureButton(
        title: "Записать голосовое напомининие",
        color: .red)
    
    let listVoiceButton = CreatorViews.configureButton(
        title: "Список голосовых напоминай",
        color: .red)
    //MARK: Actions
    func actionsButton() {
        voiceAddButton.addTarget(self, action: #selector(startRecording), for: .touchUpInside)
        listVoiceButton.addTarget(self, action: #selector(pushListVC), for: .touchUpInside)
    }
    
    @objc func pushListVC() {
        navigationController?.pushViewController(ListVoiceViewController(), animated: true)
    }
    
    @objc func startRecording() {
        VoiceRecordManager.countVoice += 1
        viewModel?.startRecording(completion: { [weak self] in
            self?.voiceAddButton.setTitle("Идёт запись", for: .normal)
            self?.voiceAddButton.isEnabled = false
            UserDefaults.standard.set(VoiceRecordManager.countVoice, forKey: "numberVoice")
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [weak self] in
                self?.voiceAddButton.setTitle("Записать голосовое напомининие", for: .normal)
                self?.voiceAddButton.isEnabled = true
                self?.viewModel?.aiduoRecorder.stop()
                self?.coreData.saveContext()
            }
        })
    }
    //MARK: Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = MainViewModel()
        setupHerarhy()
        setupLayuot()
        actionsButton()
        viewModel?.saveNumbers()
    }
    //MARK: setupHerarhy
    private func setupHerarhy() {
        view.backgroundColor = .white
        view.addSubview(voiceAddButton)
        view.addSubview(listVoiceButton)
    }
    
}


