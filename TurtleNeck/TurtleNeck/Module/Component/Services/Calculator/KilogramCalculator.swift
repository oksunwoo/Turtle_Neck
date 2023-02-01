//
//  KilogramCalculator.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2022/12/27.
//

import Foundation

func calculateKilogram(with degree: Int) -> Int {
    switch degree {
    case 0:
        return 5
    case 1...15:
        return 12
    case 16...30:
        return 18
    case 31...45:
        return 22
    case 46...60:
        return 27
    default:
        return 27
    }
}
