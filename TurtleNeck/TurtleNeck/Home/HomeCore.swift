//
//  HomeCore.swift
//  TurtleNeck
//
//  Created by 권나영 on 2022/11/22.
//

import ComposableArchitecture

struct HomeCore: ReducerProtocol {
    struct State: Equatable {
        var summary = SummaryCore.State()
    }
    
    enum Action: Equatable {
        case summary(SummaryCore.Action)
    }
    
    var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            default:
              return .none
            }
        }
        Scope(state: \.summary, action: /Action.summary) {
          SummaryCore()
        }
    }
}

