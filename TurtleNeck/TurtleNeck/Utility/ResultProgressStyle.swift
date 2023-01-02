//
//  ResultProgressStyle.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2022/12/23.
//

import SwiftUI

struct ResultProgressStyle: ProgressViewStyle {
    var strokeColor = Color("DeepBlue")
    var strokeWidth = 25.0
    
    func makeBody(configuration: Configuration) -> some View {
        let fractionCompleted = configuration.fractionCompleted ?? 0
        
        return ZStack {
            Circle()
                .trim(from: 0, to: fractionCompleted)
                .stroke(strokeColor, style: StrokeStyle(lineWidth: strokeWidth, lineCap: .round))
                .rotationEffect(.degrees(-90))
        }
    }
}

struct ResultProgressStyle_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView()
            .progressViewStyle(ResultProgressStyle())
    }
}
