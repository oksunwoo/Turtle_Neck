//
//  VerticalLine.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2022/12/23.
//

import SwiftUI

struct VerticalLine: Shape {
    func path(in rect: CGRect) -> Path {
        return Path {
            $0.move(to: CGPoint(x: 25, y: 0))
            $0.addLine(to: CGPoint(x: 25, y: 100))
            $0.closeSubpath()
        }
    }
}

struct VerticalLine_Previews: PreviewProvider {
    static var previews: some View {
        VerticalLine()
            .stroke(Color(uiColor: .systemGray5), lineWidth: 3)
    }
}
