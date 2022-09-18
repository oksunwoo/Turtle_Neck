//
//  TurtleNeckApp.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2022/08/23.
//

import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth

@main
struct TurtleNeckApp: App {
    @AppStorage("isFirstLaunching") var isFirstLaunching = true
    
    init() {
        let KAKAO_APP_KEY = Bundle.main.infoDictionary?["KAKAO_APP_KEY"] as? String ?? "KAKAO_APP_KEY is nil"
        KakaoSDK.initSDK(appKey: KAKAO_APP_KEY, loggingEnable:true)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .fullScreenCover(isPresented: $isFirstLaunching) {
                    OnboardingView(isFirstLaunching: $isFirstLaunching)
                }
                .onOpenURL(perform: { url in
                    if (AuthApi.isKakaoTalkLoginUrl(url)) {
                        AuthController.handleOpenUrl(url: url)
                    }
                })
        }
    }
}
