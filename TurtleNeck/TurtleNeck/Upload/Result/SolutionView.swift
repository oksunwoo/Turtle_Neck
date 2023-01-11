//
//  SolutionView.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2022/12/23.
//

import SwiftUI

struct SolutionView: View {
    let grade: Grade
    
    var body: some View {
        VStack (alignment: .leading, spacing: 15) {
            Text("Solution")
                .font(.headline)
                .padding(.top, 8)
                .padding(.leading, 15)
                .foregroundColor(Color(.systemGray4))
            VStack (spacing: 10) {
                Text(grade.longDescription)
                    .fontWeight(.semibold)
                    .lineSpacing(5)
                    .foregroundColor(Color.deepBlue)
            }
            .font(.footnote)
            .padding(.bottom)
            .padding(.horizontal, 14)
            .frame(minWidth: 0, maxWidth: .infinity)
        }
        .background(Color.white)
    }
}

struct SolutionView_Previews: PreviewProvider {
    static var previews: some View {
        SolutionView(grade: .veryGood)
    }
}
