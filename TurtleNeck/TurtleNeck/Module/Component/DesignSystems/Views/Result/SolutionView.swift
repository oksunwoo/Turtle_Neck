//
//  SolutionView.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2022/12/23.
//

import SwiftUI

struct SolutionView: View {
    let grade: Grade
    let degree: Int
    
    var body: some View {
        VStack (alignment: .leading, spacing: 15) {
            Text("Result")
                .font(.headline)
                .padding(.top, 8)
                .padding(.leading, 15)
                .foregroundColor(Color(.systemGray4))
            VStack (alignment: .leading, spacing: 10) {
                Text("검사 결과 목과 어깨 사이의 각도가 \(degree)° 를 이루고 있어요.")
                    .fontWeight(.semibold)
                Text(grade.longDescription)
                    .fontWeight(.semibold)
                    .lineSpacing(5)
            }
            .foregroundColor(Color.deepBlue)
            .font(.footnote)
            .padding(.bottom)
            .padding(.horizontal, 14)
            .frame(minWidth: 0, maxWidth: .infinity)
        }
        .background(Color.white)
    }
}

struct SolutionView_Previews: PreviewProvider {
    static var previews: some View {
        SolutionView(grade: .veryGood, degree: 12)
    }
}
