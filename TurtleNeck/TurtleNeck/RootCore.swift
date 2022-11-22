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
    
    enum Tab {
        case home, setting
    }
}

enum RootAction {
    case home(HomeState)
    case setting(SettingState)
    case selectTab(RootState.Tab)
}

struct RootEnvironment {
    var mainQueue: AnySchedulerOf<DispatchQueue>
    
    static let live = Self(mainQueue: .main)
}

let rootReducer = Reducer<RootState, RootAction, RootEnvironment> { state, action, _ in
        switch action {
        case .home, .setting:
                return .none
            
        case let .selectTab(tab):
            state.currentTab = tab
            return .none
        }
    }
