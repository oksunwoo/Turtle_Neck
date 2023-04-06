//
//  Pose.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2022/12/09.
//

import Foundation

// MARK: - Pose
struct Pose: Decodable, Equatable {
    let predictions: [[String: Prediction]]
}

// MARK: - Prediction
struct Prediction: Decodable, Equatable {
    let score, x, y: Double
}
