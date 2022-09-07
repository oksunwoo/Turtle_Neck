//
//  SettingsRow.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2022/09/07.
//

import SwiftUI

struct SettingsRow: View {
    let title: String
    
    var body: some View {
        HStack {
            Text(title)
            Spacer()
        }
    }
}

struct SettingsRow_Previews: PreviewProvider {
    static var previews: some View {
        SettingsRow(title: "미리보기")
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
