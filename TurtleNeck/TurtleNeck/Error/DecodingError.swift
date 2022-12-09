//
//  DecodingError.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2022/12/09.
//

import Foundation

enum DecodingError: LocalizedError {
    case failedToDecode
}

extension DecodingError {
    var errorDescription: String {
        switch self {
        case .failedToDecode:
            return "형식에 맞는 사진을 올려주세요."
        }
    }
}
