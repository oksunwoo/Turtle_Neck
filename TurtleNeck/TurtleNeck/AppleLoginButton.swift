//
//  AppleLoginButton.swift
//  TurtleNeck
//
//  Created by 권나영 on 2022/09/25.
//

import SwiftUI

struct AppleLoginButton: View {
    let completion: () -> Void
    
    var body: some View {
        Button {
            completion()
        } label: {
            Image("AppleButton")
                .resizable()
                .frame(width: 270, height: 50)
                .aspectRatio(contentMode: .fit)
                .padding(.vertical, 0)
        }
    }
}

struct AppleLoginButton_Previews: PreviewProvider {
    static var previews: some View {
        AppleLoginButton { }
    }
}
