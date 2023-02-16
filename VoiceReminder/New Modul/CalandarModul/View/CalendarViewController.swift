//
//  CalendarViewController.swift
//  VoiceReminder
//
//  Created by Daniil Litvinov on 15.02.2023.
//

import UIKit

class CalendarViewController: UIViewController {
    var event = EventsViewController()
    var coreDate = CoreDataManager()
    //MARK: Variabes
    let calendar = CreatorViews.configureCalendar()
    //MARK: Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHerarchy()
        setupLayuot()
        setupCalendar()
    }
    private func setupHerarchy() {
        view.backgroundColor = .white
        view.addSubview(calendar)
        calendar.delegate = self
    }
}

extension CalendarViewController: UICalendarViewDelegate, UICalendarSelectionMultiDateDelegate {
   
    func setupCalendar() {
        let dateSelections = UICalendarSelectionMultiDate(delegate: self)
        calendar.selectionBehavior = dateSelections
        calendar.delegate = self
    }
    
    func multiDateSelection(_ selection: UICalendarSelectionMultiDate, didSelectDate dateComponents: DateComponents) {
        guard let date = dateComponents.date as? Date else { return }
        print(date)
        let managerObject = EventEN()
        managerObject.date = date
        dismiss(animated: true)
    }
    
    func multiDateSelection(_ selection: UICalendarSelectionMultiDate, didDeselectDate dateComponents: DateComponents) {
    }
}
