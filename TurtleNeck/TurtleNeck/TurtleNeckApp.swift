//
//  TurtleNeckApp.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2022/08/23.
//

import SwiftUI

@main
struct TurtleNeckApp: App {
    @AppStorage("isFirstLaunching") var isFirstLaunching = true
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .fullScreenCover(isPresented: $isFirstLaunching) {
                    OnboardingView(isFirstLaunching: $isFirstLaunching)
                }
        }
    }
}
