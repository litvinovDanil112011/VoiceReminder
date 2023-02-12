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
    //MARK: Actions
    private func actions() {
        addImageButton.addTarget(self, action: #selector(addImageEvent), for: .touchUpInside)
    }
    
    //MARK: Life cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = EventsViewModel()
        setupHerarchy()
        setupLayuot()
        actions()
    }
    private func setupHerarchy() {
        view.backgroundColor = .white
        view.addSubview(titleEvent)
        view.addSubview(addImageButton)
        view.addSubview(addVoiceButton)
        view.addSubview(saveEvent)
    }
}
