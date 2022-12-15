//
//  CriteriaView.swift
//  TurtleNeck
//
//  Created by 권나영 on 2022/12/14.
//

import SwiftUI
import ComposableArchitecture

struct SummaryView: View {
    let store: StoreOf<SummaryCore>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            List {
                Section {
                    PoseRow(summary: .perfect)
                    PoseRow(summary: .good)
                    PoseRow(summary: .bad)
                } header: {
                    Text("Criteria").font(.headline).foregroundColor(.black)
                }
                .onTapGesture {
                    viewStore.send(.setSheet(isPresented: true))
                }
            }
            .listStyle(InsetGroupedListStyle())
            .sheet(isPresented: viewStore.binding(
                get: \.isSheetPresented,
                send: SummaryCore.Action.setSheet
            )
            ) {
                IfLetStore(self.store.scope(
                    state: \.summaryDetail,
                    action: SummaryCore.Action.summaryDetail
                )
                ) {_ in
                    CardView(summary: .perfect)
                }
            }
            .padding(.top, 15)
        }
    }
}

struct CriteriaView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView(
            store: Store(
                initialState: SummaryCore.State(),
                reducer: SummaryCore()
            )
        )
    }
}
