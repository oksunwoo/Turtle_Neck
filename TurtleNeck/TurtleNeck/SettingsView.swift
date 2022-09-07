//
//  SettingsView.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2022/08/26.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink {
                    SettingsDetail()
                } label: {
                    SettingsRow(title: "DD")
                }

            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
