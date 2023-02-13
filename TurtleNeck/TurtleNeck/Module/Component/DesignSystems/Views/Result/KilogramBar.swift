//
//  KilogramBar.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2023/02/13.
//

import SwiftUI

struct KilogramBar: View {
    var body: some View {
        VStack(alignment: .trailing, spacing: -5) {
            Text("kg")
                .offset(y: -10)
            RoundedRectangle(cornerRadius: 5, style: .continuous)
                .frame(width: 270, height: 30)
                .foregroundColor(Color.clear)
            HStack(spacing: 35) {
                ScaleBar(kilogram: 0)
                    .offset(x: -3.5)
                ScaleBar(kilogram: 5)
                ScaleBar(kilogram: 10)
                ScaleBar(kilogram: 15)
                ScaleBar(kilogram: 20)
                ScaleBar(kilogram: 25)
            }
        }
    }
}

struct KilogramBar_Previews: PreviewProvider {
    static var previews: some View {
        KilogramBar()
    }
}
