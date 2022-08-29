//
//  PopUpButton.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2022/08/26.
//

import SwiftUI

struct PopUpButton: View {
    @State private var length: CGFloat = 0
    @State private var leftCirclePosition: CGFloat = 0
    @State private var rightCirclePosition: CGFloat = 0
    
    private let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            HStack(spacing: -45) {
                TrimmedCircle(degrees: 90)
                    .onReceive(timer) { input in
                        withAnimation {
                            self.leftCirclePosition += 1
                        }
                    }
                    .offset(x: -leftCirclePosition, y: 0)
                VariableRectangle()
                    .onReceive(timer) { input in
                        withAnimation {
                            self.length += 0.041
                        }
                    }
                    .scaleEffect(x: length, y: 1)
                TrimmedCircle(degrees: -90)
                    .onReceive(timer) { input in
                        withAnimation {
                            self.rightCirclePosition += 1
                        }
                    }
                    .offset(x: rightCirclePosition, y: 0)
            }
        }
    }
}

struct TrimmedCircle: View {
    let degrees: Double
    
    var body: some View {
        Circle()
            .trim(from: 0, to: 0.5)
            .rotation(.degrees(degrees))
            .frame(width: 40, height: 40)
    }
}

struct VariableRectangle: View {
    var body: some View {
        Rectangle()
            .frame(width: 50, height: 40)
    }
}

struct PopUpButton_Previews: PreviewProvider {
    static var previews: some View {
        PopUpButton()
    }
}
