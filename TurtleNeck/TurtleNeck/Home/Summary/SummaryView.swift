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
            
            List(viewStore.rows,
                 id: \.id,
                 selection: viewStore.binding(
                    get: \.selection?.id,
                    send: SummaryCore.Action.showDetailView(selection:))) { row in
                    PoseRow(summary: row.summary)
                }
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
                        SummaryDetailView(summary: viewStore.selection!.value!.summary)
                    }
                }
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
