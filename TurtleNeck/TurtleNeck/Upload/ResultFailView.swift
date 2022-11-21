//
//  ResultFailView.swift
//  TurtleNeck
//
//  Created by 권나영 on 2022/09/30.
//

import SwiftUI

struct ResultFailView: View {
    let failImage = ["confuse1", "confuse2", "confuse3", "confuse4"]
    
    var body: some View {
        VStack {
            Image(failImage.randomElement()!)
                .resizable()
                .frame(width: 150, height: 150)
                .padding(.top, 20)
            Text("자세를 분석하는데 실패했어요")
                .foregroundColor(.gray)
                .font(.title2)
                .padding(.top, 20)
                .padding(.bottom, 100)
            noticeText()
        }
    }
}

struct ResultFailView_Previews: PreviewProvider {
    static var previews: some View {
        ResultFailView()
    }
}

extension ResultFailView {
    func noticeText() -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text("이런경우 사진분석이 어려워요")
                    .font(.title3)
                    .padding(.bottom, 10)
                Text("\u{2022} 상반신만 찍었을 때")
                Text("\u{2022} 사람이 아닌경우")
                Text("\u{2022} 머리부터 발끝까지! 전신사진이 아닌경우")
                Text("\u{2022} 너무 많은 사람이 찍혔을경우")
                Spacer()
            }
            .foregroundColor(.gray)
            .padding()
            Spacer()
        }
    }
}
