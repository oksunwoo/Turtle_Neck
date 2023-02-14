//
//  ResultProgressStyle.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2022/12/23.
//

import SwiftUI

struct ResultProgressStyle: ProgressViewStyle {
    var strokeColor = Color.deepBlue
    var strokeWidth = 25.0
    var degree: Double
    @State var fractionCompleted = 0.0
    
    func makeBody(configuration: Configuration) -> some View {
        return ZStack {
            Circle()
                .stroke(Color.gray.opacity(0.1), style: StrokeStyle(lineWidth: strokeWidth, lineCap: .round))
            Circle()
                .trim(from: 0, to: fractionCompleted)
                .stroke(strokeColor, style: StrokeStyle(lineWidth: strokeWidth, lineCap: .butt))
                .rotationEffect(.degrees(-90))
                .shadow(radius: 3, y: 3)
                .animation(.linear(duration: 1.5), value: fractionCompleted)
                .onAppear {
                    fractionCompleted += (1 - degree/360)
                }
        }
    }
}

struct ResultProgressStyle_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView()
            .progressViewStyle(ResultProgressStyle(degree: 27))
    }
}
