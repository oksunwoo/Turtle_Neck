//
//  ContentView.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2022/08/23.
//

import SwiftUI
import ComposableArchitecture

struct ContentView: View {
    @State private var isShowing = false
    let store: Store<RootState, RootAction>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            ZStack(alignment: .bottom) {
                TabView(selection: viewStore.binding(get: { $0.currentTab }, send: RootAction.selectTab)) {
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
                PopUpButton(action: {
                    isShowing = true
                })
                .padding(.bottom, 30)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(
            store: Store(
                initialState: RootState(),
                reducer: rootReducer,
                environment: RootEnvironment(mainQueue: .main)
            )
        )
    }
}
