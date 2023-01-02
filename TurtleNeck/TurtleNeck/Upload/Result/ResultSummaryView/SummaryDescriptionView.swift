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
        VStack (spacing: 10) {
            Text(summary.longDescription)
                .fontWeight(.semibold)
                .lineSpacing(5)
                .foregroundColor(Color("DeepBlue"))
        }
        .font(.footnote)
        .padding(.bottom)
        .padding(.horizontal, 14)
    }
}

struct SummaryDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryDescriptionView(summary: .veryGood)
    }
}
