//
//  SummaryCore.swift
//  TurtleNeck
//
//  Created by 권나영 on 2022/12/15.
//

import Foundation
import ComposableArchitecture

struct SummaryCore: ReducerProtocol {
    struct State: Equatable {
        var summaryDetail: SummaryDetailCore.State?
        var isSheetPresented: Bool { self.summaryDetail != nil }
    }
    
    enum Action: Equatable {
        case setSheet(isPresented: Bool)
        case showDetailView
        case summaryDetail(SummaryDetailCore.Action)
    }
    
    var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case .setSheet(isPresented: true):
                return .task {
                    return .showDetailView
                }
                
            case .setSheet(isPresented: false):
                state.summaryDetail = nil
                return .none
                
            case .showDetailView:
                state.summaryDetail = SummaryDetailCore.State()
                return .none
                
            case .summaryDetail:
                return .none
            }
        }
        .ifLet(\.summaryDetail, action: /Action.summaryDetail) {
            SummaryDetailCore()
        }
    }
}
