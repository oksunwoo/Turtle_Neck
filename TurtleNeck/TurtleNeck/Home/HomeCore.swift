//
//  HomeCore.swift
//  TurtleNeck
//
//  Created by 권나영 on 2022/11/22.
//

import SwiftUI
import CoreData
import ComposableArchitecture

struct HomeCore: ReducerProtocol {
    struct State: Equatable {
        var optionalResult: ResultCore.State?
        var isNavigationActive = false
    }
    
    enum Action: Equatable {
        case optionalResult(ResultCore.Action)
        case poseItemTapped(isNavigationActive: Bool, data: FetchedResults<User>.Element)
    }
    
    var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case .optionalResult:
                return .none
                
            case .poseItemTapped(isNavigationActive: true, let data):
                state.isNavigationActive = true
                state.optionalResult = ResultCore.State(resultImage: UIImage(data: data.image!)!, degree: data.degree, score: Int(data.score), validity: data.validity)
                
                return .none
                
            case .poseItemTapped(isNavigationActive: false, _):
                state.isNavigationActive = false
                state.optionalResult = nil
                return .none
            }
        }
        .ifLet(\.optionalResult, action: /Action.optionalResult) {
            ResultCore()
        }
    }
}

