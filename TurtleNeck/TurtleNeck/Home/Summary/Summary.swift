//
//  Rule.swift
//  TurtleNeck
//
//  Created by 권나영 on 2022/12/15.
//

import Foundation

enum Summary: String {
    case perfect = "Perfect"
    case good = "Good"
    case bad = "Bad"
    
    var shortDescription: String {
        switch self {
        case .perfect:
            return "훌륭해요"
        case .good:
            return "좋아요"
        case .bad:
            return "아쉬워요"
        }
    }
    
    var longDescription: String {
        switch self {
        case .perfect:
            return "설명"
        case .good:
            return "좋아요"
        case .bad:
            return "아쉬워요"
        }
    }
    
    var imageString: String {
        switch self {
        case .perfect:
            return "Pose3"
        case .good:
            return "Pose5"
        case .bad:
            return "Pose4"
        }
    }
    
    var star: Int {
        switch self {
        case .perfect:
            return 5
        case .good:
            return 3
        case .bad:
            return 1
        }
    }
}
