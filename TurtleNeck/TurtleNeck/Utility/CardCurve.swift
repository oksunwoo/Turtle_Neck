//
//  CardCurve.swift
//  TurtleNeck
//
//  Created by 권나영 on 2022/12/14.
//

import SwiftUI

struct CardCurve: Shape {
    func path(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height
        
        return Path {
            $0.move(to: CGPoint(x: 0, y: height * 0.1))
            $0.addCurve(to: CGPoint(x: width * 0.1, y: 0),
                        control1: CGPoint(x: 0, y: height * 0.05),
                        control2: CGPoint(x: width * 0.05, y: 0))
            
            $0.addLine(to: CGPoint(x: width * 0.9, y: 0))
            
            $0.addCurve(to: CGPoint(x: width, y: height * 0.1),
                        control1: CGPoint(x: width * 0.95, y: 0),
                        control2: CGPoint(x: width, y: height * 0.05))
            
            $0.addLine(to: CGPoint(x: width, y: height))
            $0.addLine(to: CGPoint(x: 0, y: height))
        }
    }
}

struct CardCurve_Previews: PreviewProvider {
    static var previews: some View {
        CardCurve()
    }
}
