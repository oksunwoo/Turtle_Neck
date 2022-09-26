//
//  SettingsView.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2022/08/26.
//

import SwiftUI
import MessageUI

struct SettingsView: View {
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
            .navigationTitle("Settings")
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
}
