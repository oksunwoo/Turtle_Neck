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
        var degree: Double?
        var score: Double?
        var pose: [Pose]
    }
    
    enum Action: Equatable {
        case dotButtonTapped
    }
    
    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .dotButtonTapped:
            state.resultImage = addDot(on: state.resultImage, with: state.pose)
            state.degree = calculateDegree(pose: state.pose)
            state.score = 0 >= (100 - round(state.degree! / 0.33)) ? 0 : (100 - round(state.degree! / 0.33))
            return .none
        }
    }
}
