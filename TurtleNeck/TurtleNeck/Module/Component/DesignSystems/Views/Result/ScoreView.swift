//
//  ScoreView.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2022/12/22.
//

import SwiftUI

struct ScoreView: View {
    let kilogram: Int
    
    var body: some View {
        VStack {
//            ProgressView(value: Double(kilogram), total: 27)
//                .progressViewStyle(ResultProgressStyle(kilogram: Double(kilogram)))
//                .frame(width: 200, height: 200)
//                .contentShape(Rectangle())
            ProgressBar(kilogram: CGFloat(kilogram))
                .animation(.linear(duration: 1.0), value: 0)
            RollingText(value: kilogram)
        }
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(kilogram: 10)
    }
}
