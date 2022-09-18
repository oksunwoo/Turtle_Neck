//
//  LoginView.swift
//  TurtleNeck
//
//  Created by 권나영 on 2022/08/25.
//

import SwiftUI
import KakaoSDKUser

struct OnboardingView: View {
    @Binding var isFirstLaunching: Bool
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack() {
            HStack(alignment: .center) {
            Image("LaunchScreenLogo")
                .resizable()
                .frame(width: 300, height: 50)
                .padding(.top, 60)
            }
           
            TabView {
                OnboardingItem(image: "tortoise.fill", title: "당신은 거북이")
                OnboardingItem(image: "person.fill.questionmark", title: "인가요?")
                OnboardingItem(image: "hand.point.right.fill", title: "알아보러 갑시다")
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            
            VStack(spacing: 20) {
                Button {
                    if (UserApi.isKakaoTalkLoginAvailable()) {
                        // 카카오톡 설치
                        UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                            if let error = error {
                                print(error)
                            }
                            else {
                                print("loginWithKakaoTalk() success.")
                                
                                // userdefault에 access토큰 저장
//                                UserDefaults.standard.set(oauthToken, forKey: "accessToken")
                                isFirstLaunching = false
                                presentationMode.wrappedValue.dismiss()
                            }
                        }
                    } else {
                        // 카카오톡 미설치
                        // 웹으로 로그인
                        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                            if let error = error {
                                print(error)
                            }
                            else {
                                print("loginWithKakaoAccount() success.")

//                                UserDefaults.standard.set(oauthToken, forKey: "accessToken")
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
            HStack {
                Spacer()
                Button {
                    isFirstLaunching = false
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("둘러보기")
                        .font(.body)
                        .foregroundColor(.white)
                        .underline()
                }
                .padding()
            }
        }
        .background(Color("MainGreenColor"))
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(isFirstLaunching: .constant(true))
    }
}
