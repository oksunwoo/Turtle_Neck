//
//  ResultView.swift
//  TurtleNeck
//
//  Created by 권나영 on 2022/09/29.
//

import SwiftUI
import ComposableArchitecture

struct ResultView: View {
    let store: StoreOf<ResultCore>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            ZStack {
                Color("BackgroundColor")
                    .ignoresSafeArea()
                VStack {
                    ScoreView(score: viewStore.score ?? 0)
                    ResultItemView(resultImage: viewStore.resultImage)
                        .cornerRadius(30)
                    Button("점찍기") {
                        viewStore.send(.dotButtonTapped)
                    }
                }
            }
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(store: Store(initialState: ResultCore.State(resultImage: UIImage(named: "Pose1")!, pose: [Pose]()), reducer: ResultCore()))
    }
}
