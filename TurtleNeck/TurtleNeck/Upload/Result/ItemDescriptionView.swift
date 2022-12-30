//
//  ItemDescriptionView.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2022/12/23.
//

import SwiftUI

struct ItemDescriptionView: View {
    var summary: Summary?
    var score: Double?
    var degree: Double?
    
    var body: some View {
        if score == nil {
            Text("현재 목의 각도가 \(Int(round(degree!)))º 기울어져 있습니다.")
        }
        
        if degree == nil {
            VStack {
                HStack {
                    ForEach(0..<summary!.star, id: \.self) { _ in
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    }
                }
                .padding()
                Text(summary!.shortDescription)
                    .bold()
            }
        }
    }
}

struct ItemDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDescriptionView(summary: Summary.perfect, score: 30)
    }
}
