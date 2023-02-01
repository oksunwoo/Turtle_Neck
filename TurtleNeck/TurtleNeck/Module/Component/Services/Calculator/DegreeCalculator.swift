//
//  calculateDegree.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2022/12/21.
//

import Foundation

func calculateDegree(pose: [Pose]) -> Int {
    guard let pose = pose.first else {
        return 0
    }
    
    let leftEar = 9
    let rightEar = 12
    let leftShoulder = 15
    let rightShoulder = 18
    
    let keypoints = pose.keypoints
    let leftSide = keypoints[leftEar + 2] > keypoints[rightEar + 2] ? true : false
    
    var base = 0.0
    var height = 0.0
    
    if leftSide {
        base = abs(keypoints[leftEar + 1] - keypoints[leftShoulder + 1])
        height = abs(keypoints[leftEar] - keypoints[leftShoulder])
    } else {
        base = abs(keypoints[rightEar + 1] - keypoints[rightShoulder + 1])
        height = abs(keypoints[rightEar] - keypoints[rightShoulder])
    }
    
    let radian = atan(height/base)
    let degree = round((radian * 180/Double.pi) * 100) / 100
    
    return Int(degree)
}
