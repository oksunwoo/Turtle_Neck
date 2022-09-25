//
//  SettingsView.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2022/08/26.
//

import SwiftUI
import MessageUI
import KakaoSDKAuth
import KakaoSDKUser

struct SettingsView: View {
    @State private var showProfile = false
    private let mailComposeDelegate = MailDelegate()
    
    var body: some View {
        NavigationView {
            List {
                SettingsRow(setting: .notice)
                SettingsRow(setting: .version)
                Button {
                    presentMailCompose()
                } label: {
                    Text("1:1 문의")
                        .foregroundColor(.black)
                }
            }
            .toolbar {
                HStack {
                    Spacer()
                    Button {
                        showProfile.toggle()
                    } label: {
                        Label("User Profile", systemImage: "person.crop.circle")
                    }
                }
            }
            .navigationTitle("Settings")
            .fullScreenCover(isPresented: $showProfile) {
                showLoginView()
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

extension SettingsView {
    private class MailDelegate: NSObject, MFMailComposeViewControllerDelegate {

        func mailComposeController(_ controller: MFMailComposeViewController,
                                   didFinishWith result: MFMailComposeResult,
                                   error: Error?) {
            switch result {
            case .sent:
                // 메일 발송 성공
                print("메일 발송 성공")
            case .cancelled:
                // 메일 작성 취소
                print("작성 취소")
            case .saved:
                // 메일 임시저장
                print("임시저장")
            case .failed:
                // 메일 발송 실패(오류 발생)
                print("오류 발생")
            }
            controller.dismiss(animated: true)
        }
    }

    private func presentMailCompose() {
        let rootVC = UIApplication.shared.keyWindow?.rootViewController
        
        guard MFMailComposeViewController.canSendMail() else {
            // Mail 앱을 사용할 수 없는 경우
            let alert = UIAlertController(title: "메일전송불가", message: "시뮬레이터에서는 메일 전송이 불가합니다", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "ok", style: .default)
            alert.addAction(okAction)
            rootVC?.present(alert, animated: true)
            return
        }

        let composeVC = MFMailComposeViewController()
        composeVC.mailComposeDelegate = mailComposeDelegate

        composeVC.setToRecipients(["kny0651@naver.com"])
        composeVC.setSubject("터틀넥 문의하기")
        composeVC.setMessageBody("문의내용: ", isHTML: true)
        
        rootVC?.present(composeVC, animated: true)
    }
    
    // ViewBuilder 왜 붙여야하는지 모르겠네
    @ViewBuilder
    func showLoginView() -> some View {
            if AuthApi.hasToken() {
                // 토큰있을때 access token 다시 저장해야하는지 의문
                // 저장해야하는거같은데 어떻게 해야하는지 모르겠따
                // 분명 refresh token으로 access token 얻는다고 했는데 왜 access token만 주는걸까...?
                
//                UserApi.shared.accessTokenInfo { accessToken, error in
//                    if let error = error {
//                        if let sdkError = error as? SdkError, sdkError.isInvalidTokenError() == true  {
//                            //로그인 필요
//                             EmptyProfileView()
//                        }
//                    }
//                    // 토큰 유효성 체크 성공(필요시 토큰 갱신됨)
//                    ProfileView(showingProfile: $showingProfile)
//                }
                ProfileView(showingProfile: $showProfile)
            } else {
                 EmptyProfileView(showEmptyProfile: $showProfile)
            }
    }
}
