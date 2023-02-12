//
//  EventsViewController.swift
//  VoiceReminder
//
//  Created by Daniil Litvinov on 12.02.2023.
//

import UIKit
import AVFoundation

class EventsViewController: UIViewController {
    
    var viewModel: EventsViewModelProtocol?
    //MARK: Varibes
    let titleEvent = CreatorViews.configureTextField()
    let addImageButton = CreatorViews.configureButton(
        title: "Добавить изображение",
        color: .red)
    let addVoiceButton = CreatorViews.configureButton(
        title: "Добавить голосовое события",
        color: .red)
    let saveEvent = CreatorViews.configureButton(
        title: "Cохранить события",
        color: .green)
    let installDate = CreatorViews.configureButton(
        title: "Установить дату напоминание",
        color: .red)
    //MARK: Actions
    private func actions() {
        addImageButton.addTarget(self, action: #selector(addImageEvent), for: .touchUpInside)
        addVoiceButton.addTarget(self, action: #selector(voiceOfRecordor), for: .touchUpInside)
        saveEvent.addTarget(self, action: #selector(saveEventOfList), for: .touchUpInside)
    }
    @objc func voiceOfRecordor() {
        viewModel?.isRecorder.toggle()
        viewModel?.voiceOfRecording(completion: { [weak self] in
            if self?.viewModel?.isRecorder == true {
                self?.addVoiceButton.setTitle("Идёт запись. Для остановки нажмитие еще раз.", for: .normal)
            } else {
                self?.addVoiceButton.setTitle("Голосовое события записано. Для нового голосового наопоминание нажмите еще раз", for: .normal)
            }
        })
        print("\(EventVoiceManager.countNameVoice)")
    }
    @objc func saveEventOfList() {
        EventVoiceManager.countNameVoice += 1
    }

    //MARK: Life cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = EventsViewModel()
        setupHerarchy()
        setupLayuot()
        actions()
        //viewModel?.saveNumbers()
    }
    private func setupHerarchy() {
        view.backgroundColor = .white
        view.addSubview(titleEvent)
        view.addSubview(addImageButton)
        view.addSubview(addVoiceButton)
        view.addSubview(saveEvent)
        view.addSubview(installDate)
    }
}
