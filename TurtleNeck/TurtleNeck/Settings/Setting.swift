//
//  Setting.swift
//  TurtleNeck
//
//  Created by 권나영 on 2022/09/19.
//

import Foundation

enum Setting {
    case notice
    case version
    
    var koreanValue: String {
        switch self {
        case .notice:
            return "공지사항"
        case .version:
            return "버전 정보"
        }
    }
}
