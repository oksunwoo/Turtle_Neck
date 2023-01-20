//
//  SettingsDetail.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2022/09/07.
//

import SwiftUI

struct NoticeView: View {
    let sampleNotice = [Notice(title: "터틀넥 신규 앱 런칭 안내",
                               noticeItems: [Notice(title: "운전을 오래하느라, 스마트폰을 많이 사용하느라, 책상 앞에 오래 앉아있느라 뻐근한 목. \n내가 거북목일까 아닐까 검사하기 불편하셨죠? \n이제 사진 한장으로 간편하게 검사해보세요.", noticeItems: nil)])]
    
    var body: some View {
        List(sampleNotice, children: \.noticeItems) { item in
            Text(item.title)
                .font(.subheadline)
        }
        .navigationTitle("공지사항")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct NoticeView_Previews: PreviewProvider {
    static var previews: some View {
        NoticeView()
    }
}
