//
//  TurtleNeckApp.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2022/08/23.
//

import SwiftUI
import ComposableArchitecture

@main
struct TurtleNeckApp: App {
    @AppStorage("isFirstLaunching") var isFirstLaunching = true
    
    var body: some Scene {
        WindowGroup {
            ContentView(store: Store(initialState: RootState(),
                                     reducer: rootReducer,
                                     environment: .live
                                    )
                        )
                .fullScreenCover(isPresented: $isFirstLaunching) {
                    OnboardingView(isFirstLaunching: $isFirstLaunching)
                }
        }
    }
}
