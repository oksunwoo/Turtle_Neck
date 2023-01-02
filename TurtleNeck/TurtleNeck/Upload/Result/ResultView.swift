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
            NavigationView {
                ZStack {
                    Color("BackgroundColor")
                        .ignoresSafeArea()
                    VStack {
                        ScoreView(score: viewStore.score)
                            .padding(.bottom, 50)
                        VStack {
                            ResultItemView(resultImage: viewStore.resultImage.addDot(with: viewStore.pose), degree: viewStore.degree)
                                .cornerRadius(10)
                                .padding(.bottom, 10)
                            SolutionView(result: Result(score: Int(viewStore.score)))
                                .cornerRadius(10)
                        }
                        .frame(width: 350)
                        .fixedSize(horizontal: true, vertical: true)
                        .shadow(radius: 3, y: 3)
                    }
                }
            }
            .navigationTitle("분석 결과")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ResultView(store: Store(initialState: ResultCore.State(resultImage: UIImage(named: "Pose1")!, degree: 0, score: 100, pose: [Pose]()), reducer: ResultCore()))
        }
    }
}
