//
//  ResultItemView.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2022/12/22.
//

import SwiftUI

struct ResultItemView: View {
    let resultImage: UIImage
    let score: Int
    let degree: Double
    let validity: Double
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Report")
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 8)
                .foregroundColor(Color(.systemGray4))
            
            HStack {
                ResultImageView(resultImage: resultImage)
                VerticalLine()
                    .stroke(Color.background, lineWidth: 2)
                    .frame(width: 1, height: 140)
                ResultDescriptionView(score: score, degree: degree, result: Result(score: score), validity: validity)
                    .frame(minWidth: 0, maxWidth: .infinity)
            }
        }
        .padding(.bottom, 10)
        .background(Color.white)
    }
}

struct ResultItemView_Previews: PreviewProvider {
    static var previews: some View {
        ResultItemView(resultImage: UIImage(named: "Pose1")!, score: 50, degree: 30, validity: 66.6)
    }
}
