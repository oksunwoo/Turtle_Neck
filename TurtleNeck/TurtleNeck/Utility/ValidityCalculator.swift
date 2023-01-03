//
//  ValidityCalculator.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2023/01/03.
//

import Foundation

func calculateValidity(pose: [Pose]) -> Double {
    var validity = 0.0
    
    guard let pose = pose.first else {
        return validity
    }
    
    let nose = 0
    let leftEye = 3
    let rightEye = 6
    let leftEar = 9
    let rightEar = 12
    let leftShoulder = 15
    let rightShoulder = 18
    
    let keypoints = pose.keypoints
    let leftSide = keypoints[leftEye + 2] > keypoints[rightEye + 2] ? true : false
    
    if leftSide {
        validity = (keypoints[nose + 2] + keypoints[leftEye + 2] + keypoints[leftEar + 2] + keypoints[leftShoulder + 2]) / 4
    } else {
        validity = (keypoints[nose + 2] + keypoints[rightEye + 2] + keypoints[rightEar + 2] + keypoints[rightShoulder + 2]) / 4
    }
    
    let result = Double(Int(validity * 10000)) / 100
    
    return result
}
