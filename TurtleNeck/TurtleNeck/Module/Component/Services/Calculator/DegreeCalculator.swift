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
    let rightSoulder = "2"
    
    
    let leftSide = pose.keys.contains(leftEar)
    var base = 0.0
    var height = 0.0
    
    if leftSide {
        base = abs(pose[leftEar]!.y - pose[leftShoulder]!.y)
        height = abs(pose[leftEar]!.x - pose[leftShoulder]!.x)
    } else {
        base = abs(pose[rightEar]!.y - pose[rightSoulder]!.y)
        height = abs(pose[rightEar]!.x - pose[rightSoulder]!.x)
    }
    
    let radian = atan(height/base)
    let degree = round((radian * 180/Double.pi) * 100) / 100
    
    return Int(degree)
}
