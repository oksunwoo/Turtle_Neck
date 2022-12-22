//
//  PoseRow.swift
//  TurtleNeck
//
//  Created by 권나영 on 2022/12/14.
//

import SwiftUI

struct SummaryRow: View {
    let summary: Summary
    
    var body: some View {
        HStack {
            Image(summary.imageString)
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            
            Text(summary.shortDescription)
            Spacer()
            ForEach(0..<summary.star, id: \.self) { _ in
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct SummaryRow_Previews: PreviewProvider {
    static var previews: some View {
        SummaryRow(summary: .perfect)
    }
}
