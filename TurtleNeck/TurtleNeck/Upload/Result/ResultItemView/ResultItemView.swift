//
//  ResultItemView.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2022/12/22.
//

import SwiftUI

struct ResultItemView: View {
    let resultImage: UIImage
    let degree: Double
    
    var body: some View {
        HStack {
            ResultImageView(resultImage: resultImage)
            VerticalLine()
                .stroke(Color(uiColor: .systemGray5), lineWidth: 2)
                .frame(width: CGFloat(50), height: CGFloat(100))
            ResultDescriptionView(degree: degree)
        }
        .background(Color.white)
    }
}

struct ResultItemView_Previews: PreviewProvider {
    static var previews: some View {
        ResultItemView(resultImage: UIImage(named: "Pose1")!, degree: 30)
    }
}
