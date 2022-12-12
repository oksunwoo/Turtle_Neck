//
//  Decoder.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2022/12/12.
//

import Foundation

enum Decoder {
    static func decoder(with data: Data) -> Pose? {
        do {
            return try JSONDecoder().decode(Pose.self, from: data)
        } catch {
            print(DecodingError.failedToDecode.errorDescription)
        }
        return nil
    }
}
