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
            ContentView(
                store: Store(
                    initialState: Root.State(),
                    reducer: Root())
            )
            .environment(\.managedObjectContext, DataManager.shared.container.viewContext)
            .fullScreenCover(isPresented: $isFirstLaunching) {
                OnboardingView(isFirstLaunching: $isFirstLaunching)
            }
        }
    }
}
