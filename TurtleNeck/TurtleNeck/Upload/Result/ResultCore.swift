//
//  ResultCore.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2022/12/19.
//

import SwiftUI
import ComposableArchitecture

struct ResultCore: ReducerProtocol {
    struct State: Equatable {
        var resultImage: UIImage
        var degree: Double
        var score: Int
        var validity: Double
        var isPoseNil = true
    }
    
    enum Action: Equatable {
       
    }
    
    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
      
    }
}
