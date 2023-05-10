//
//  TemeVoiceViewController.swift
//  VoiceReminder
//
//  Created by Daniil Litvinov on 10.05.2023.
//

import UIKit

class TemeVoiceViewController: UIViewController {
    //MARK: life cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        title = "Выбор времни записи"
        view.backgroundColor = .white
    }
    
}
