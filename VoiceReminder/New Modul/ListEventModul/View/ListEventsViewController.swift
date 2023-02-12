//
//  ListEventsViewController.swift
//  VoiceReminder
//
//  Created by Daniil Litvinov on 12.02.2023.
//

import UIKit

class ListEventsViewController: UIViewController {
    
    //MARK: Variabes
    private lazy var listEventTable: UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    //MARK: Life cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHerarchy()
        setupLayuot()
    }
    private func setupHerarchy() {
        view.backgroundColor = .white
        view.addSubview(listEventTable)
    }
    private func setupLayuot() {
        NSLayoutConstraint.activate([
            listEventTable.topAnchor.constraint(equalTo: view.topAnchor),
            listEventTable.leftAnchor.constraint(equalTo: view.leftAnchor),
            listEventTable.rightAnchor.constraint(equalTo: view.rightAnchor),
            listEventTable.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
extension ListEventsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EventVoiceManager.countNameVoice
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listEventTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(DetailViewController(), animated: true)
    }
    
}
