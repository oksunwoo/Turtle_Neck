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
        ZStack {
            ProgressView(value: Double(kilogram), total: 27)
                .progressViewStyle(ResultProgressStyle(kilogram: Double(kilogram)))
                .frame(width: 200, height: 200)
                .contentShape(Rectangle())
            RollingText(value: kilogram)
        }
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(kilogram: 27)
    }
}
