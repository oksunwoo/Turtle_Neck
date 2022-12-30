//
//  Rule.swift
//  TurtleNeck
//
//  Created by 권나영 on 2022/12/15.
//

import Foundation

enum Summary: String {
    case excellent = "Excellent"
    case veryGood = "Very Good"
    case good = "Good"
    case dangerous = "Dangerous"
    case terrible = "Terrible"
    
    var shortDescription: String {
        switch self {
        case .excellent:
            return "완벽해요"
        case .veryGood:
            return "훌륭해요"
        case .good:
            return "아직은 괜찮아요"
        case .dangerous:
            return "아쉬워요"
        case .terrible:
            return "치료가 필요해요"
        }
    }
    
    var longDescription: String {
        switch self {
        case .excellent:
            return "고개와 어깨가 일직선에 가까워요\n"
        case .veryGood:
            return ""
        case .good:
            return "좋아요"
        case .dangerous:
            return ""
        case .terrible:
            return "아쉬워요"
        }
    }
    
    var imageString: String {
        switch self {
        case .excellent:
            return "Result-Excellent"
        case .veryGood:
            return ""
        case .good:
            return "Result-Good"
        case .dangerous:
            return ""
        case .terrible:
            return "Result-Terrible"
        }
    }
    
    var star: Int {
        switch self {
        case .excellent:
            return 5
        case .veryGood:
            return 4
        case .good:
            return 3
        case .dangerous:
            return 2
        case .terrible:
            return 1
        }
    }
}
