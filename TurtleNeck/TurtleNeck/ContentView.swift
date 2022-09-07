//
//  ContentView.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2022/08/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView() {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            SettingsView()
                .tabItem {
                    Label("Account", systemImage: "person.crop.circle")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
