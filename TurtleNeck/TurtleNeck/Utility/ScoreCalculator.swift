//
//  ScoreCalculator.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2022/12/27.
//

import Foundation

func calculateScore(with degree: Double) -> Double {
    var score = 100 - round(degree / 0.33)
    
    if score <= 0 {
        return 0
    }
    
    return score
}
