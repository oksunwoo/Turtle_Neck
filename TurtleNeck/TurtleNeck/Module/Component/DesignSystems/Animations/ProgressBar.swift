//
//  ProgressBar.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2023/02/10.
//

import SwiftUI

struct ProgressBar: View {
    var kilogram: CGFloat
    @State var multiplier: CGFloat = 0
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 5, style: .continuous)
                .frame(width: 270, height: 30)
                .foregroundColor(Color.black.opacity(0.1))
            
            RoundedRectangle(cornerRadius: 5, style: .continuous)
                .frame(width: multiplier, height: 30)
                .background(LinearGradient(gradient: Gradient(colors: [Color.deepBlue, Color.cyan]),
                                           startPoint: .leading, endPoint: .trailing)
                    .clipShape(RoundedRectangle(cornerRadius: 5, style: .continuous))
                )
                .foregroundColor(.clear)
                .animation(.linear(duration: 1.3), value: multiplier)
                .onAppear {
                    multiplier += kilogram * 10
                }
        }
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(kilogram: 10)
    }
}
