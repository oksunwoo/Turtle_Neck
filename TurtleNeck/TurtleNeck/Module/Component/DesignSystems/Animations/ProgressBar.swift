//
//  ProgressBar.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2023/02/10.
//

import SwiftUI

struct ProgressBar: View {
    var width: CGFloat = 270
    var kilogram: CGFloat = 0
    
    var body: some View {
        let multiplier = kilogram * 10
        
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .frame(width: width, height: 30)
                .foregroundColor(Color.black.opacity(0.1))
            
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .frame(width: multiplier, height: 30)
            .background(LinearGradient(gradient: Gradient(colors: [Color.deepBlue, Color.cyan]),
                                       startPoint: .leading, endPoint: .trailing)
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            )
            
            .foregroundColor(.clear)
        }
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar()
    }
}
