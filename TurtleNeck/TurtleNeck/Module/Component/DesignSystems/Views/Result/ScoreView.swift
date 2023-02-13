//
//  ScoreView.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2022/12/22.
//

import SwiftUI

struct ScoreView: View {
    let kilogram: Int
    let degree: Int
    
    var body: some View {
        VStack(spacing: 40) {
            ZStack {
                ProgressBar(kilogram: CGFloat(kilogram))
                KilogramBar()
                    .offset(y: 8)
            }
            ZStack {
                ProgressView(value: Double(degree), total: 50)
                    .progressViewStyle(ResultProgressStyle(degree: Double(degree)))
                    .frame(width: 150, height: 150)
                    .contentShape(Rectangle())
                HStack(spacing: 2) {
                    RollingText(value: degree)
                    Text("°")
                        .offset(y: -10)
                }
            }
        }
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(kilogram: 5, degree: 45)
    }
}
