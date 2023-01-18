//
//  BottomCurve.swift
//  TurtleNeck
//
//  Created by 권나영 on 2022/12/13.
//

import SwiftUI

struct BottomCurve: Shape {
        func path(in rect: CGRect) -> Path {
            let height = rect.maxY * 0.5
            let width = rect.width
            
            return Path {
                
                $0.move(to: CGPoint(x: 0, y: 0))
                $0.addLine(to: CGPoint(x: width * 0.3, y: 0))
                
                $0.addCurve(to: CGPoint(x: rect.midX, y: height),
                            control1: CGPoint(x: rect.midX * 0.85, y: rect.minY),
                            control2: CGPoint(x: rect.midX * 0.75, y: height))
                
                $0.addCurve(to: CGPoint(x: width * 0.7, y: 0),
                            control1: CGPoint(x: rect.midX * 1.25, y: height),
                            control2: CGPoint(x: rect.midX * 1.15, y: rect.minY))
            }
        }
    }

struct BottomCurve_Previews: PreviewProvider {
    static var previews: some View {
        BottomCurve()
    }
}

