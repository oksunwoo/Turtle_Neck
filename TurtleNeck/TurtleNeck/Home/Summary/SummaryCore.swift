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
        var selection: Identified<Row.ID, SummaryDetailCore.State?>?
        
        var rows: IdentifiedArrayOf<Row> = [
            Row(summary: .perfect, id: UUID()),
            Row(summary: .good, id: UUID()),
            Row(summary: .bad, id: UUID())
        ]
        
        struct Row: Equatable, Identifiable {
            let summary: Summary
            let id: UUID
        }
    }
    
    enum Action: Equatable {
        case setSheet(isPresented: Bool)
        case showDetailView(selection: UUID?)
        case setNavigationSelectionDelayCompleted
        case summaryDetail(SummaryDetailCore.Action)
    }
    
    private enum CancelID {}
    
    var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case .setSheet(isPresented: true):
                return .none
                
            case .setSheet(isPresented: false):
                state.summaryDetail = nil
                return .none
                
            case let .showDetailView(selection: .some(id)):
                state.selection = Identified(nil, id: id)
                return .task {
                    return .setNavigationSelectionDelayCompleted
                }
                
            case .showDetailView(selection: .none):
                state.selection = nil
                return .none
                
            case .setNavigationSelectionDelayCompleted:
                guard let id = state.selection?.id else { return .none }
                state.selection?.value = SummaryDetailCore.State(summary: state.rows[id: id]?.summary ?? .perfect)
                state.summaryDetail = state.selection?.value
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
