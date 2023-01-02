//
//  ScoreView.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2022/12/22.
//

import SwiftUI

struct ScoreView: View {
    let score: Double
    
    var body: some View {
        ZStack {
            ProgressView(value: score, total: 100)
                .progressViewStyle(ResultProgressStyle())
                .frame(width: 200, height: 200)
                .contentShape(Rectangle())
                .shadow(radius: 3, y: 3)
            Text(String(Int(score)))
                .font(.system(size: 40))
        }
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(score: 50)
    }
}
