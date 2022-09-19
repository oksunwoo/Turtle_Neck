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
                switch setting {
                case .notice:
                    SettingsDetail()
                case .version:
                    SettingsDetail()
                }
            } label: {
                switch setting {
                case .notice:
                    Text(setting.koreanValue)
                case .version:
                    Text(setting.koreanValue)
                }
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
