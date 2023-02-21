//
//  EventsViewController.swift
//  VoiceReminder
//
//  Created by Daniil Litvinov on 12.02.2023.
//

import UIKit
import AVFoundation
import CoreData

class EventsViewController: UIViewController {
    var coreData = CoreDataManager()
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
        installDate.addTarget(self, action: #selector(pushedCalendar), for: .touchUpInside)
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(keyborgOn)))
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keybordWillShow(natificitions:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keybordWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
    }
    @objc func voiceOfRecordor() {
        viewModel?.isRecorder.toggle()
        viewModel?.voiceOfRecording(completion: { [weak self] in
            if self?.viewModel?.isRecorder == true {
                self?.addVoiceButton.setTitle("Идёт запись. Для остановки нажмитие еще раз.", for: .normal)
            } else {
                self?.addVoiceButton.setTitle("Голосовое события записано. Для нового голосового напоминание нажмите еще раз", for: .normal)
            }
        })
        print("\(EventVoiceManager.countNameVoice)")
    }
    @objc func saveEventOfList() {
        EventVoiceManager.countNameVoice += 1
        coreData.saveContext()
    }
    @objc func pushedCalendar() {
        present(CalendarViewController(), animated: true)
    }
    @objc func keyborgOn() {
        self.view.endEditing(true)
    }
    @objc func keybordWillShow(natificitions: NSNotification){
        if let keyboafrFrame: NSValue = natificitions.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboard = keyboafrFrame.cgRectValue.height
            let bottonSpace = view.frame.height - (titleEvent.frame.origin.y + titleEvent.frame.height)
            view.frame.origin.y -= keyboard - bottonSpace + 10
        }
    }
    @objc func keybordWillHide(){
        view.frame.origin.y = 0
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
