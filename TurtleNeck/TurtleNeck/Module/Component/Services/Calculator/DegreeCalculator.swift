//
//  calculateDegree.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2022/12/21.
//

import Foundation

func calculateDegree(pose: Pose) -> Int {
    guard let pose = pose.predictions.first else {
        return 0
    }
    
    let leftEar = "17"
    let rightEar = "16"
    let leftShoulder = "5"
    let rightShoulder = "2"
    
    let leftSide = pose.keys.contains(leftShoulder) && pose.keys.contains(leftEar)
    let rightSide = pose.keys.contains(rightShoulder) && pose.keys.contains(rightEar)
    var base = 0.0
    var height = 0.0
    
    if leftSide {
        base = abs(pose[leftEar]!.y - pose[leftShoulder]!.y)
        height = abs(pose[leftEar]!.x - pose[leftShoulder]!.x)
    } else if rightSide {
        base = abs(pose[rightEar]!.y - pose[rightShoulder]!.y)
        height = abs(pose[rightEar]!.x - pose[rightShoulder]!.x)
    } else {
        return 0
    }
    
    let radian = atan(height/base)
    let degree = round((radian * 180/Double.pi) * 100) / 100
    
    return Int(degree)
}
