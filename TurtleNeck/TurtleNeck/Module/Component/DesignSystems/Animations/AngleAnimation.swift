//
//  AngleAnimation.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2023/02/13.
//

import SwiftUI

struct AngleAnimation: View {
    let degree: Int
    @State var angle: Int = 0
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 2, height: 70)
            Rectangle()
                .frame(width: 2, height: 70)
                .rotationEffect(.degrees(Double(-angle)), anchor: UnitPoint(x: 1, y: 1))
                .animation(.linear(duration: 1.5), value: angle)
                .onAppear {
                    angle += degree
                }
        }
    }
}

struct AngleAnimation_Previews: PreviewProvider {
    static var previews: some View {
        AngleAnimation(degree: 8)
    }
}
