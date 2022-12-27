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
                    ScoreView(score: viewStore.score)
                    ResultItemView(resultImage: viewStore.resultImage.addDot(with: viewStore.pose))
                        .cornerRadius(30)
                }
            }
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(store: Store(initialState: ResultCore.State(resultImage: UIImage(named: "Pose1")!,degree: 0, score: 100, pose: [Pose]()), reducer: ResultCore()))
    }
}
