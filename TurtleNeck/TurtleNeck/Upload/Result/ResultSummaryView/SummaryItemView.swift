//
//  SummaryItemView.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2022/12/30.
//

import SwiftUI

struct SummaryItemView: View {
    let summary: Result
    
    var body: some View {
        HStack {
            SummaryImageView(summary: summary)
            VerticalLine()
                .stroke(Color(uiColor: .systemGray5), lineWidth: 2)
                .frame(width: 1, height: 100)
            SummaryDescriptionView(summary: summary)
                .frame(minWidth: 0, maxWidth: .infinity)
        }
        .background(Color.white)
    }
}

struct SummaryItemView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryItemView(summary: .dangerous)
    }
}
