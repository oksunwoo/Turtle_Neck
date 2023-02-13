//
//  ScaleBar.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2023/02/13.
//

import SwiftUI

struct ScaleBar: View {
    var kilogram: Int
    
    var body: some View {
        VStack(spacing: 0) {
            Rectangle()
                .frame(width: 1, height: 10)
            Text("\(kilogram)")
        }
    }
}

struct ScaleBar_Previews: PreviewProvider {
    static var previews: some View {
        ScaleBar(kilogram: 27)
    }
}
