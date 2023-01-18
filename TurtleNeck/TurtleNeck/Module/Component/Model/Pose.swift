//
//  Pose.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2022/12/09.
//

import Foundation

struct Pose: Decodable, Equatable {
    let area: Double
    let bbox: [Double]
    let categoryId: Int
    let keypoints: [Double]
    let score: Double
    
    enum CodingKeys: String, CodingKey {
        case area, bbox, keypoints, score
        case categoryId = "category_id"
    }
}
