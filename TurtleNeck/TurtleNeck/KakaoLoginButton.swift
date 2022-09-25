//
//  KakaoLoginButton.swift
//  TurtleNeck
//
//  Created by 권나영 on 2022/09/25.
//

import SwiftUI
import KakaoSDKUser
import KakaoSDKAuth
import KakaoSDKCommon

struct KakaoLoginButton: View {
    let completion: () -> Void
    
    var body: some View {
        Button {
            loginWithKakao {
                completion()
            }
        } label: {
            Image("KakaoButton")
                .resizable()
                .frame(width: 270, height: 50)
                .aspectRatio(contentMode: .fit)
                .padding(.vertical, 0)
        }
    }
}

struct KakaoLoginButton_Previews: PreviewProvider {
    static var previews: some View {
        KakaoLoginButton { }
    }
}

extension KakaoLoginButton {
    func loginWithKakao(completion: @escaping () -> Void) {
        if (UserApi.isKakaoTalkLoginAvailable()) {
            // 카카오톡 설치
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")
                    
                    if let accessToken = try? JSONEncoder().encode(oauthToken!) {
                        UserDefaults.standard.set(accessToken, forKey: "accessToken")
                    }
                    completion()
                }
            }
        } else {
            // 카카오톡 미설치 - 웹으로 로그인
            UserApi.shared.loginWithKakaoAccount { (oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoAccount() success.")
                    
                    if let accessToken = try? JSONEncoder().encode(oauthToken!) {
                        UserDefaults.standard.set(accessToken, forKey: "accessToken")
                    }
//                    setUserInfo()
                    completion()
                }
            }
        }
    }
}

