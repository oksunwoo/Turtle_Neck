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
        var pose: [Pose]
    }
    
    enum Action: Equatable {
        case dotButtonTapped
    }
    
    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .dotButtonTapped:
            state.resultImage = addDot(on: state.resultImage, with: state.pose)
            calculateDegree(pose: state.pose)
            return .none
        }
    }
}
