//
//  MainViewController.swift
//  VoiceReminder
//
//  Created by Daniil Litvinov on 02.05.2023.
//

import UIKit

final class MainViewController: UIViewController {
    //MARK: Var
    var viewModel: MainScreenViewModelProtocol?
    private lazy var topSpaser = ConfigureViews.share.configureViewSpaser()
    private lazy var testONEButton = ConfigureViews.share.configureButton(
        "test",
        backgroundColor: .cyan,
        radius: 30,
        image: nil)
    private lazy var testTWOButton = ConfigureViews.share.configureButton(
        "test2",
        backgroundColor: .cyan,
        radius: 30,
        image: nil)
    private lazy var centerSpaser = ConfigureViews.share.configureViewSpaser()
    private lazy var bottonSpaser = ConfigureViews.share.configureViewSpaser()
    private lazy var startVoiceRecButton = ConfigureViews.share.configureButton(
        "Новое голосовое напоминание",
        backgroundColor: .red,
        radius: nil,
        image: UIImage(systemName: "mic"))
    private lazy var listVoiseButton = ConfigureViews.share.configureButton(
        "Cписок голосовых напоминаний",
        backgroundColor: .blue,
        radius: nil,
        image: nil)
    //MARK: LIfe cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupLayuot()
        actions()
        viewModel = MainScreenViewModel()
        setupBarItems()
    }
    //MARK: ACtions
    private func actions() {
        listVoiseButton.addTarget(self, action: #selector(pushList), for: .touchUpInside)
        startVoiceRecButton.addTarget(self, action: #selector(startRec), for: .touchUpInside)
    }
    @objc func pushList() {
        navigationController?.pushViewController(ListVoiceViewController(), animated: true)
    }
    @objc func startRec() {
        let seconds = SecondOfTimer.share.getSeconds()
        viewModel?.startRecord(completion: { [ weak self ] in
            self?.listVoiseButton.isEnabled = false
            UIView.animate(withDuration: 1) { [ weak self] in
                self?.listVoiseButton.transform = CGAffineTransform(translationX: 0, y: -100)
                self?.startVoiceRecButton.transform = CGAffineTransform(translationX: 0, y: 250)
                self?.testONEButton.transform = CGAffineTransform(translationX: -400, y: 0)
                self?.testTWOButton.transform = CGAffineTransform(translationX: 400, y: 0)
                self?.listVoiseButton.setTitle("Идёт запись, время записи \(seconds) секунд", for: .normal)
                self?.listVoiseButton.tintColor = .white
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + SecondOfTimer.share.getSecind(sec: seconds) - 2) {
                self?.listVoiseButton.setTitle("Голосовое напоминание сохранено", for: .normal)
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + SecondOfTimer.share.getSecind(sec: seconds))
            {  [ weak self] in
                self?.listVoiseButton.setTitle("Cписок голосовых напоминаний", for: .normal)
                self?.startVoiceRecButton.transform = .identity
                self?.listVoiseButton.isEnabled = true
                self?.listVoiseButton.transform = .identity
                self?.testONEButton.transform = .identity
                self?.testTWOButton.transform = .identity
                self?.startVoiceRecButton.transform = .identity
            }
        })
    }
    @objc func pushSettings() {
        navigationController?.pushViewController(SettingsViewController(), animated: true)
    }
    //MARK: setupViews
    private func setupViews() {
        view.backgroundColor = .white
        title = "Главный экран"
        view.addSubview(topSpaser)
        view.addSubview(testONEButton)
        view.addSubview(testTWOButton)
        view.addSubview(centerSpaser)
        view.addSubview(startVoiceRecButton)
        view.addSubview(bottonSpaser)
        view.addSubview(listVoiseButton)
        
    }
    //MARK: setupBarItems
    private func setupBarItems() {
        let settingScreen = UIBarButtonItem(
            image: UIImage(systemName: "gearshape.2"),
            style: .plain,
            target: self,
            action: nil)
        navigationItem.rightBarButtonItem = settingScreen
        settingScreen.tintColor = .black
        settingScreen.backgroundImage(for: .normal, barMetrics: .compact)
        settingScreen.menu = addMenu()
    }
    //MENU setting
   private func addMenu() -> UIMenu {
        let menuItems = UIMenu(title: "", children: [
            UIAction(title: "Нacтройки", image: UIImage(systemName: "gearshape"), handler: { _ in
                self.navigationController?.pushViewController(SettingsViewController(), animated: true)
            }),
            // для добавление в списка в меню
//            UIAction(title: "Нacтройки", image: UIImage(systemName: "gearshape"), handler: { _ in
//                self.navigationController?.pushViewController(SettingsViewController(), animated: true)
//            })
        ])
        return menuItems
    }
    
    //MARK: LAYUOT
    private func setupLayuot() {
        NSLayoutConstraint.activate([
            topSpaser.topAnchor.constraint(equalTo: view.topAnchor),
            topSpaser.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1 / 9),
            topSpaser.widthAnchor.constraint(equalTo: view.widthAnchor),
            topSpaser.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            testONEButton.topAnchor.constraint(equalTo: topSpaser.bottomAnchor),
            testONEButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            testONEButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1 / 1.2),
            testONEButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1 / 7),
            
            testTWOButton.bottomAnchor.constraint(equalTo: centerSpaser.topAnchor),
            testTWOButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            testTWOButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1 / 1.2),
            testTWOButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1 / 7),
            
            centerSpaser.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            centerSpaser.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            centerSpaser.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1 / 14),
            centerSpaser.widthAnchor.constraint(equalTo: view.widthAnchor),
            
            listVoiseButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            listVoiseButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1 / 1.2),
            listVoiseButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1 / 7),
            listVoiseButton.topAnchor.constraint(equalTo: centerSpaser.bottomAnchor),
            
            bottonSpaser.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bottonSpaser.topAnchor.constraint(equalTo: listVoiseButton.bottomAnchor),
            bottonSpaser.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1 / 10),
            bottonSpaser.widthAnchor.constraint(equalTo: view.widthAnchor),
            
            startVoiceRecButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startVoiceRecButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1 / 1.2),
            startVoiceRecButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1 / 7),
            startVoiceRecButton.topAnchor.constraint(equalTo: bottonSpaser.bottomAnchor)
        ])
    }
    
}
