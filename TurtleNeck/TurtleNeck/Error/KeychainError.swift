//
//  KeychainError.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2022/12/09.
//

import Foundation

enum KeychainError: LocalizedError {
    case failedToGetAccountID
}

extension KeychainError {
    var errorDescription: String {
        switch self {
        case .failedToGetAccountID:
            return "PoseInfo.plist에 API_KEY 설정을 확인해주세요."
        }
    }
}
