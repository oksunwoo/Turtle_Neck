//
//  Pose.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2022/12/09.
//

import Foundation

// MARK: - Pose
struct Pose: Codable {
    let predictions: [[String: Prediction]]
}

// MARK: - Prediction
struct Prediction: Codable {
    let score, x, y: Double
}
