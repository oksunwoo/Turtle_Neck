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
            ZStack {
                ProgressBar(kilogram: CGFloat(kilogram))
                KilogramBar()
                    .offset(y: 5)
            }
        }
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(kilogram: 5)
    }
}
