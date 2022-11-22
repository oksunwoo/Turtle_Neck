//
//  RootCore.swift
//  TurtleNeck
//
//  Created by 권나영 on 2022/11/22.
//

import UIKit
import ComposableArchitecture

struct RootState: Equatable {
    var home = HomeState()
    var setting = SettingState()
    var currentTab: Tab = .home
    var optionalPose: PoseState?
    
    enum Tab {
        case home, setting
    }
}

enum RootAction {
    case home(HomeState)
    case setting(SettingState)
    case selectTab(RootState.Tab)
    case optionalPose(PoseAction)
    case setSheet(isPresented: Bool)
}

struct RootEnvironment {
    var mainQueue: AnySchedulerOf<DispatchQueue>
    
    static let live = Self(mainQueue: .main)
}

let rootReducer = Reducer<RootState, RootAction, RootEnvironment>.combine(
    .init { state, action, _ in
        switch action {
        case .home, .setting:
            return .none
            
        case let .selectTab(tab):
            state.currentTab = tab
            return .none
            
        case .optionalPose:
            return .none
            
        case .setSheet(isPresented: true):
            state.optionalPose = PoseState()
            return .none
            
        case .setSheet(isPresented: false):
            state.optionalPose = nil
            return .none
        }
    },
    poseReducer
        .optional()
        .pullback(
            state: \.optionalPose,
            action: /RootAction.optionalPose,
            environment: { _ in PoseEnvironment() }
        )
)
