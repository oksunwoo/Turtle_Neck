//
//  ContentView.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2022/08/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowing = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
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
            
            DeviderView()
            PopUpButton(action: {
                isShowing = true
            })
            .padding(.bottom, 30)
        }
        .fullScreenCover(isPresented: $isShowing) {
            UploadImageView(isShowing: $isShowing)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
