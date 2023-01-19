//
//  RootCore.swift
//  TurtleNeck
//
//  Created by 권나영 on 2022/11/22.
//

import ComposableArchitecture

struct Root: ReducerProtocol {
    struct State: Equatable {
        var currentTab: Tab = .home
        var optionalPose: PoseCore.State?
        
        enum Tab {
            case home, setting
        }
    }
    
    enum Action: Equatable {
        case onAppear
        case selectTab(State.Tab)
        case optionalPose(PoseCore.Action)
        case setSheet(isPresented: Bool)
    }
    
    var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                state = .init()
                return .none
                
            case .selectTab(let tab):
                state.currentTab = tab
                return .none
                
            case .setSheet(isPresented: true):
                state.optionalPose = PoseCore.State()
                return .none
                
            case .setSheet(isPresented: false):
                state.optionalPose = nil
                return .none
                
            default:
                return .none
            }
        }
        .ifLet(\.optionalPose, action: /Action.optionalPose) {
            PoseCore()
        }
    }
}
