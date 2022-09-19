//
//  SettingsRow.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2022/09/07.
//

import SwiftUI

struct SettingsRow: View {
    let setting: Setting
    
    var body: some View {
        HStack {
            NavigationLink {
                SettingsDetail()
            } label: {
                Text(setting.rawValue)
            }
            Spacer()
        }
    }
}

struct SettingsRow_Previews: PreviewProvider {
    static var previews: some View {
        SettingsRow(setting: .notice)
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
