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
    
    init(score: Int) {
        switch score {
        case 80...:
            self = .excellent
        case 60..<80:
            self = .veryGood
        case 40..<60:
            self = .good
        case 20..<40:
            self = .dangerous
        case ..<20:
            self = .terrible
        default:
            self = .terrible
        }
    }
    
    var shortDescription: String {
        switch self {
        case .excellent:
            return "완벽해요"
        case .veryGood:
            return "훌륭해요"
        case .good:
            return "아직은 괜찮아요"
        case .dangerous:
            return "위험해요"
        case .terrible:
            return "치료가 필요해요"
        }
    }
    
    var longDescription: String {
        switch self {
        case .excellent:
            return "목과 어깨가 일직선에 가까워요. 귀와 어깨를 같은 선상에 놓는다는 느낌으로 턱을 살짝 당기는 게 올바른 자세랍니다. 항상 바른자세를 유지해 목건강을 지켜봅시다."
        case .veryGood:
            return "목과 어깨각도가 13도 미만이에요. \n컴퓨터를 사용할 때는 모니터 상단과 눈높이가 일치하도록 하고 시선이 아래로 15~30도 이내에 머물도록 조정해보세요. 의자에 앉을 때 등허리를 쭉 펴는 자세를 유지해 봅시다."
        case .good:
            return "아직은 괜찮지만 옆에서 봤을 때 고개가 어깨보다 앞으로 빠져나와있어요. \n컴퓨터 작업을 할때 한시간에 한 번씩 5~10분 정도 서있거나 가볍게 걸으면서 스트레칭을 해주세요."
        case .dangerous:
            return "어깨와 목 주위가 자주 뻐근한가요? \n잘못된 자세로 오래앉아있다보면 작업능률도 저하되고 쉽게 피로해질 수 있어요. 어깨와 가슴을 펴고 모니터를 눈높이까지 올려 맞춰주세요."
        case .terrible:
            return "목과 어깨각도가 26도 이상이에요. x-ray를 통해 전반적인 목의 상태를 확인해보세요. 증상이 심한경우 전문기관에서 전문가와 상의 후 기구를 이용한 교정운동이 필요해 보입니다."
        }
    }
}
