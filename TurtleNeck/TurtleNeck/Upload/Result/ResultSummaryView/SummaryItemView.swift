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
