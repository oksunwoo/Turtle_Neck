//
//  PopUpButton.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2022/08/26.
//

import SwiftUI

struct PopUpButton: View {
    let action: () -> Void
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 50, height: 50)
                .foregroundColor(.blue)
            Text("N")
                .foregroundColor(.white)
                .font(.title)
                .bold()
        }
        .onTapGesture {
            action()
        }
    }
}

struct PopUpButton_Previews: PreviewProvider {
    static var previews: some View {
        PopUpButton { }
    }
}
