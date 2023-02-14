//
//  ResultView.swift
//  TurtleNeck
//
//  Created by 권나영 on 2022/09/29.
//

import SwiftUI
import ComposableArchitecture

struct ResultView: View {
    @Environment(\.managedObjectContext) var context
    
    let store: StoreOf<ResultCore>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            if viewStore.isPoseNil {
                ResultFailView()
            } else {
                ZStack {
                    Color.background
                        .ignoresSafeArea()
                    VStack {
                        ScoreView(kilogram: viewStore.kilogram, degree: viewStore.degree)
                            .padding(.bottom, 50)
                        VStack {
                            ResultItemView(resultImage: viewStore.resultImage, kilogram: viewStore.kilogram, degree: viewStore.degree)
                                .cornerRadius(10)
                                .padding(.bottom, 10)
                            SolutionView(grade: Grade(kilogram: viewStore.kilogram), degree: viewStore.degree)
                                .cornerRadius(10)
                        }
                        .frame(width: 350)
                        .fixedSize(horizontal: true, vertical: true)
                        .shadow(radius: 3, y: 3)
                    }
                }
                .onAppear {
                    viewStore.send(.saveData(in: context))
                }
                .navigationTitle("분석 결과")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ResultView(
                store: Store(
                    initialState: ResultCore.State(
                        resultImage: UIImage(named: "Pose1")!,
                        degree: 0, kilogram: 5, date: Date()),
                    reducer: ResultCore()
                )
            )
        }
    }
}
