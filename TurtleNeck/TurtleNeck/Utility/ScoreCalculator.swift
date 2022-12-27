//
//  ScoreCalculator.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2022/12/27.
//

import Foundation

func calculateScore(with degree: Double) -> Double {
    if degree >= 0 {
       return  100 - round(degree / 0.33)
    }
    
    return 0
}
