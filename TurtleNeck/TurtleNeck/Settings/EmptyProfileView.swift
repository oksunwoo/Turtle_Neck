//
//  EmptyProfileView.swift
//  TurtleNeck
//
//  Created by 권나영 on 2022/09/20.
//

import SwiftUI

struct EmptyProfileView: View {
    @Binding var showEmptyProfile: Bool
    
    var body: some View {
        VStack(spacing: 20) {
            closeButton()
            Text("유저 정보가 없습니다. 로그인해주세요")
            
            KakaoLoginButton {
                showEmptyProfile.toggle()
            }
            AppleLoginButton {
                showEmptyProfile.toggle()
            }
        }
    }
}

struct EmptyProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyProfileView(showEmptyProfile: .constant(true))
    }
}

extension EmptyProfileView {
    func closeButton() -> some View {
        HStack {
            Spacer()
            Button {
                showEmptyProfile.toggle()
            } label: {
                Text("x")
                    .bold()
                    .font(.title2)
                    .foregroundColor(.black)
                    .padding(.trailing, 20)
            }
        }
    }
}
