//
//  SettingsDetail.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2022/09/07.
//

import SwiftUI
 
struct SettingsDetail: View {
    let sampleNotice = [Notice(title: "눈 떠보니 벌써 9월, 1.1.0 업데이트 안내",
                                   noticeItems: [Notice(title: "원하는 나이, 성별끼리 모이고 싶은데 번거로운 절차를 만들고 확인하느라 불편하셨죠? \n 이제 그룹채팅방 만들기에서 채팅방 입장 조건을 선택해서 원하는 성별과 출생년도를 설정해보세요", noticeItems: nil)])]
    
    var body: some View {
        List(sampleNotice, children: \.noticeItems) { item in
            Text(item.title)
                .font(.subheadline)
        }
        .navigationTitle("공지사항")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SettingsDetail_Previews: PreviewProvider {
    static var previews: some View {
        SettingsDetail()
    }
}
