//
//  ItemDescriptionView.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2022/12/23.
//

import SwiftUI

struct ItemDescriptionView: View {
    var body: some View {
        VStack {
            HStack {
                ForEach(0..<5, id: \.self) { _ in
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
            }
            .padding(10)
            Text("훌륭합니다")
        }
    }
}

struct ItemDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDescriptionView()
    }
}
