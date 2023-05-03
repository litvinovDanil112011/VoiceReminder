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
    private lazy var centerSpaser = ConfigureViews.share.configureViewSpaser()
    private lazy var bottonSpaser = ConfigureViews.share.configureViewSpaser()
    private lazy var startVoiceRec = ConfigureViews.share.configureButton(
        "Новое голосовое напоминание",
        backgroundColor: .green,
        radius: nil)
    private lazy var listVoise = ConfigureViews.share.configureButton(
        "Cписок голосовых напоминаний",
        backgroundColor: .blue,
        radius: nil)
    //MARK: LIfe cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupLayuot()
        actions()
        viewModel = MainScreenViewModel()
    }
    
    private func actions() {
        listVoise.addTarget(self, action: #selector(pushList), for: .touchUpInside)
        startVoiceRec.addTarget(self, action: #selector(startRec), for: .touchUpInside)
    }
    @objc func pushList() {
        navigationController?.pushViewController(ListVoiceViewController(), animated: true)
    }
    @objc func startRec() {
        viewModel?.startRecord(completion: { [ weak self ] in
            self?.startVoiceRec.setTitle("Идёт зпась", for: .normal)
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [ weak self] in
                self?.startVoiceRec.setTitle("Cписок голосовых напоминаний", for: .normal)
            }
        })
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        title = "Главный экран"
        view.addSubview(centerSpaser)
        view.addSubview(startVoiceRec)
        view.addSubview(bottonSpaser)
        view.addSubview(listVoise)

    }
    
    private func setupLayuot() {
        NSLayoutConstraint.activate([
            centerSpaser.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            centerSpaser.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            centerSpaser.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1 / 14),
            centerSpaser.widthAnchor.constraint(equalTo: view.widthAnchor),

            listVoise.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            listVoise.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1 / 1.2),
            listVoise.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1 / 7),
            listVoise.topAnchor.constraint(equalTo: centerSpaser.bottomAnchor),
            
            bottonSpaser.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bottonSpaser.topAnchor.constraint(equalTo: listVoise.bottomAnchor),
            bottonSpaser.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1 / 10),
            bottonSpaser.widthAnchor.constraint(equalTo: view.widthAnchor),
            
            startVoiceRec.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startVoiceRec.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1 / 1.2),
            startVoiceRec.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1 / 7),
            startVoiceRec.topAnchor.constraint(equalTo: bottonSpaser.bottomAnchor)
            
        ])
    }
}
