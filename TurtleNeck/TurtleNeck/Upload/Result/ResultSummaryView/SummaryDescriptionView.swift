//
//  SummaryDescriptionView.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2022/12/23.
//

import SwiftUI

struct SummaryDescriptionView: View {
    let summary: Result
    
    var body: some View {
        VStack {
            HStack {
                ForEach(0..<summary.star, id: \.self) { _ in
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
            }
            .padding()
            Text(summary.shortDescription)
                .bold()
                .padding(.bottom, 50)
        }
        .frame(minWidth: 0, maxWidth: .infinity)
    }
}

struct SummaryDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryDescriptionView(summary: .veryGood)
    }
}
