//
//  SummaryImageView.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2022/12/30.
//

import SwiftUI

struct SummaryImageView: View {
    let summary: Result
    
    var body: some View {
        VStack (alignment: .leading) {
            Image(summary.imageString)
                .renderingMode(.original)
                .resizable()
                .frame(width: 90, height: 160)
                .cornerRadius(5)
                .padding(.all, 10)
        }
    }
}

struct SummaryImageView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryImageView(summary: .veryGood)
    }
}
