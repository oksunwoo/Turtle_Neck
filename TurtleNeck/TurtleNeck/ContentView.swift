//
//  ContentView.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2022/08/23.
//

import SwiftUI
import ComposableArchitecture

struct ContentView: View {
    let store: StoreOf<Root>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            ZStack(alignment: .bottom) {
                TabView(selection: viewStore.binding(get: { $0.currentTab }, send: Root.Action.selectTab)) {
                    HomeView()
                        .tabItem {
                            Label("Home", systemImage: "house.fill")
                        }
                    SettingsView()
                        .tabItem {
                            Label("Account", systemImage: "person.crop.circle")
                        }
                }
                
                DeviderView()
                    .foregroundColor(.gray)
                
                PopUpButton() {
                    viewStore.send(.setSheet(isPresented: true))
                }
                .padding(.bottom, 30)
                .fullScreenCover(
                    isPresented: viewStore.binding(
                        get: { $0.optionalPose != nil },
                        send: Root.Action.setSheet(isPresented:)
                    )
                ) {
//                    // content
//                    IfLetStore(
//                        self.store.scope(
//                            state: \.optionalPose,
//                            action: Root.Action.optionalPose
//                        )
//                    ) {
//                        // then
//                        // optionlPose가 nil이 아닐때
//                        // pose뷰 보여주기
//                        PoseView(store: $0)
//                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(
            store: Store(
                initialState: Root.State(),
                reducer: Root()
            )
        )
    }
}
