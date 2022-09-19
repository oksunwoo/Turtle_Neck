//
//  SettingsView.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2022/08/26.
//

import SwiftUI

enum Setting: String {
    case notice = "공지사항"
    case customerService = "1:1 문의"
    case version = "버전 정보"
}

struct SettingsView: View {
    @State private var showingProfile = false
    
    var body: some View {
        NavigationView {
            List {
                SettingsRow(setting: .notice)
                SettingsRow(setting: .customerService)
                SettingsRow(setting: .version)
            }
            .toolbar {
                HStack {
                    Spacer()
                    Button {
                        showingProfile.toggle()
                    } label: {
                        Label("User Profile", systemImage: "person.crop.circle")
                    }
                }
            }
            .navigationTitle("Settings")
            .fullScreenCover(isPresented: $showingProfile, content: {
                ProfileView(showingProfile: $showingProfile)
            })
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
