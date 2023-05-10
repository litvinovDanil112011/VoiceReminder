//
//  ModelCells.swift
//  VoiceReminder
//
//  Created by Daniil Litvinov on 10.05.2023.
//

import UIKit

struct ModelCells {
    let cellType: TypeCells
    let titleCell: String
    let image: UIImage?    
}

enum TypeCells {
    case timeSetting
    case notificationCell
}
