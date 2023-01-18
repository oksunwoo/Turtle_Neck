//
//  ResultFailView.swift
//  TurtleNeck
//
//  Created by 권나영 on 2022/09/30.
//

import SwiftUI

struct ResultFailView: View {
    var body: some View {
        VStack {
            Image("confuse")
                .resizable()
                .frame(width: 170, height: 170)
                .padding(.bottom, 30)
            
            HStack(alignment: .top) {
                Circle()
                    .foregroundColor(Color.redOrange)
                    .frame(width: 20, height: 20)
                    .overlay(
                        Text("!")
                            .font(.callout.weight(.bold))
                            .foregroundColor(.white))
                Text("이런경우 사진분석이 어려워요")
                    .font(.title2.weight(.semibold))
                    .padding(.bottom, 10)
                Spacer()
            }
            
            noticeText()
            
            Text("* 자세를 정학하게 분석하기 위해 좌측 혹은 우측을 보고 촬영해주세요. 요구 사항에 충족하지 않는 사진은 정확성에 영향을 미칠 수 있습니다.")
                .font(.subheadline.weight(.light))
                .foregroundColor(.gray)
                .padding(.top, 20)
            Spacer()
        }
        .padding(.top, 100)
        .padding(.horizontal, 30)
    }
}

struct ResultFailView_Previews: PreviewProvider {
    static var previews: some View {
        ResultFailView()
    }
}

extension ResultFailView {
    func noticeText() -> some View {
        VStack(alignment: .leading) {
            HStack(spacing: 10) {
                Circle()
                    .foregroundColor(Color.lightOrange)
                    .frame(width: 20, height: 20)
                    .overlay(
                        Text("✕")
                            .font(.caption.weight(.bold))
                            .foregroundColor(.redOrange))
                Text("상반신만 찍었을 때")
                Spacer()
            }
            HStack(spacing: 10) {
                Circle()
                    .foregroundColor(Color.lightOrange)
                    .frame(width: 20, height: 20)
                    .overlay(
                        Text("✕")
                            .font(.caption.weight(.bold))
                            .foregroundColor(.redOrange))
                Text("사람이 아닌 사물사진일 경우")
            }
            HStack(spacing: 10) {
                Circle()
                    .foregroundColor(Color.lightOrange)
                    .frame(width: 20, height: 20)
                    .overlay(
                        Text("✕")
                            .font(.caption.weight(.bold))
                            .foregroundColor(.redOrange))
                Text("너무 많은 사람이 찍혔을 경우")
            }
        }
        .font(.body.weight(.semibold))
        .padding()
        .frame(maxWidth: .infinity)
        .background(.gray.opacity(0.1))
        .cornerRadius(10)
    }
}
