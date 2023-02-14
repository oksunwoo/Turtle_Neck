//
//  Rule.swift
//  TurtleNeck
//
//  Created by 권나영 on 2022/12/15.
//

import Foundation

enum Grade: String {
    case excellent = "A"
    case veryGood = "B"
    case good = "C"
    case dangerous = "D"
    case terrible = "E"
    
    init(kilogram: Int) {
        switch kilogram {
        case 0...5:
            self = .excellent
        case 6...12:
            self = .veryGood
        case 13...18:
            self = .good
        case 19...22:
            self = .dangerous
        case 23...27:
            self = .terrible
        default:
            self = .terrible
        }
    }
    
    var longDescription: String {
        switch self {
        case .excellent:
            return "목이 5kg 의 하중을 받고있어요."
        case .veryGood:
            return "목이 12kg 의 하중을 받고있어요."
        case .good:
            return "목이 18kg 의 하중을 받고있어요."
        case .dangerous:
            return "목이 22kg 의 하중을 받고있어요."
        case .terrible:
            return "목이 27kg 이상의 하중을 받고있어요."
        }
    }
}
