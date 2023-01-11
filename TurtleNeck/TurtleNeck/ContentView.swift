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
                            Label("Settings", systemImage: "gear")
                        }
                }
                .accentColor(.white)
                .onAppear {
                    UITabBar.appearance().backgroundColor = UIColor(.deepBlue)
                    UITabBar.appearance().unselectedItemTintColor = .white.withAlphaComponent(0.5)
                    UITabBar.appearance().backgroundImage = UIImage()
                    UITabBar.appearance().isTranslucent = true
                }
                
                BottomCurve()
                    .frame(maxWidth: .infinity, maxHeight: 100)
                    .padding(.bottom, -51)
                    .foregroundColor(.background)
                
                PopUpButton() {
                    viewStore.send(.setSheet(isPresented: true))
                }
                .padding(.bottom, 30)
                .shadow(radius: 3)
                .fullScreenCover(
                    isPresented: viewStore.binding(
                        get: { $0.optionalPose != nil },
                        send: Root.Action.setSheet(isPresented:))
                ) {
                    IfLetStore(self.store.scope(state: \.optionalPose,
                                                action: Root.Action.optionalPose)) {
                        PoseView(store: $0)
                    }
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
