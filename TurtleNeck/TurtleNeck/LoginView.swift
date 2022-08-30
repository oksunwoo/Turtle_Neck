//
//  LoginView.swift
//  TurtleNeck
//
//  Created by 권나영 on 2022/08/25.
//

import SwiftUI
import KakaoSDKUser

struct LoginView: View {
    @Binding var isFirstLaunching: Bool
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        VStack() {
            HStack {
                Spacer()
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("둘러보기")
                        .font(.body)
                        .foregroundColor(.white)
                        .underline()
                }
                .padding()
            }
            TabView {
                OnboardingItem()
                OnboardingItem()
                OnboardingItem()
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            
            VStack(spacing: 20) {
                
                Button {
                    if (UserApi.isKakaoTalkLoginAvailable()) {
                        UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                            if let error = error {
                                print(error)
                            }
                            else {
                                print("loginWithKakaoTalk() success.")
                                
                                _ = oauthToken
                                isFirstLaunching = false
                                presentationMode.wrappedValue.dismiss()
                            }
                        }
                    }
                    
                } label: {
                    Image("KakaoButton")
                        .resizable()
                        .frame(width: 270, height: 50)
                        .aspectRatio(contentMode: .fit)
                        .padding(.vertical, 0)
                }
                
                Button {
                    isFirstLaunching = false
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image("AppleButton")
                        .resizable()
                        .frame(width: 270, height: 50)
                        .aspectRatio(contentMode: .fit)
                        .padding(.vertical, 0)
                }
            }
        }
        .background(Color("MainGreenColor"))
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(isFirstLaunching: .constant(true))
    }
}
