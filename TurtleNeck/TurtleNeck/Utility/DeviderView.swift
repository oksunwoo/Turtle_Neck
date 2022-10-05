//
//  Path.swift
//  TurtleNeck
//
//  Created by 권나영 on 2022/09/30.
//

import SwiftUI

struct DeviderView: View {
    var body: some View {
        Path { path in
            let x = UIScreen.main.bounds.maxX
            let y = UIScreen.main.bounds.maxY - 135
            
            let startPoint = CGPoint(x: 0, y: y)
            let endPoint = CGPoint(x: x, y: y)
            
            path.move(to: startPoint)
            path.addLine(to: endPoint)
        }
        .stroke()
    }
}

struct DeviderViewExample_Preview: PreviewProvider {
    static var previews: some View {
        DeviderView()
    }
}
