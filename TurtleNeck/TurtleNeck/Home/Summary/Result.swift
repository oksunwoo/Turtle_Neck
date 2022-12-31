//
//  Rule.swift
//  TurtleNeck
//
//  Created by 권나영 on 2022/12/15.
//

import Foundation

enum Result {
    case excellent
    case veryGood
    case good
    case dangerous
    case terrible
    
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
            return "아쉬워요"
        case .terrible:
            return "거북이 인가요?"
        }
    }
    
    var longDescription: String {
        switch self {
        case .excellent:
            return "아주 좋아요!\n목과 어깨가 일직선에 가까워요.\n가장 중요한 예방법은 바른자세를 유지하는것 이랍니다. 스마트 폰이나 모니터를 볼 때 눈높이에 맞게 사용하고 등을 곧게 펴주세요. 귀와 어깨를 같은 선상에 놓는다는 느낌으로 턱을 살짝 당기는 게 올바른 자세랍니다. 손가락을 턱에 대고 뒤로 밀고 2초 정도 유지하는 식으로 50회 반복하는것도 좋아요. 항상 바른자세를 유지해 목건강을 지켜봅시다"
        case .veryGood:
            return "이정도면 훌륭해요\n목과 어깨각도가 ??도 미만이에요.\n거북목 증후군을 예방하기위해 평소 올바른자세를 유지하도록 노력해주세요. 의자에 않을 때 누군가 정수리 부위에서 머리를 잡아당기고 있다는 느낌으로 등허리를 쭉 펴는 자세를 유지해 봅시다. 업무를 위해 컴퓨터를 사용할 때는 모니터 상단과 눈높이가 일치하도록 위치시키고 시선이 아래로 15~30도 이내에 머물도록 조정해보세요. 평상시에도 목이 앞으로 나가지 않도록 업무환경을 개선하는 것이 중요하답니다."
        case .good:
            return "아직은 괜찮아요\n하지만 옆에서 봤을 때 고개가 어깨보다 앞으로 빠져나와있어요.\n거북목 상태로 진행 중 이라고 할수있죠. 상태가 더 진행되기 전에 관리가 필요해 보여요. 장시간 동안 같은 자세로 컴퓨터 작업을 할때 한시간에 한 번씩 5~10분 정도 서있거나 가볍게 걸으면서 스트레칭을 해주세요. 목과 어깨의 긴장을 이완하는데 많은 도움이 된답니다."
        case .dangerous:
            return "위험해요\n어깨와 목 주위가 자주 뻐근한가요?\n잘못된 자세로 오래앉아있다보면 작업능률도 저하되고 쉽게 피로해질 수 있어요. 이를 방지하기위해 어깨와 가슴을 바르게 펴고 모니터를 눈높이까지 올려 맞춰주세요. 그러면 고개를 숙이지 않아도 되어서 훨씬 편안하게 모니터를 볼 수 있어요. 거북목 교정을 위해서 항상 턱을 뒤로 당기는 습관을 갖는 것도 중요하답니다."
        case .terrible:
            return "치료가 필요해요\n목과 어깨각도가 ??도 이상이에요.\nx-ray를 통해 전반적인 목의 상태를 확인해보세요. 증상이 심한경우 전문기관에서 전문가와 상의한 후 기구를 이용해 교정운동이 필요해 보여요. 거북목증후군을 방치하면 지속적으로 목 주변 근육과 인대 및 디스크에 압력이 가해져  목디스크로 진행될가능성이 높답니다. 목디스크까지 진행되기 전에 관리를 해주세요."
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
