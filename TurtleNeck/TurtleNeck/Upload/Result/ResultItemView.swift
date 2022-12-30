//
//  ResultItemView.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2022/12/22.
//

import SwiftUI

struct ResultItemView: View {
    var resultImage: UIImage?
    var degree: Double?
    var score: Double?
    
    var body: some View {
        HStack {
            ItemImageView(resultImage: resultImage ?? UIImage())
            VerticalLine()
                .stroke(Color(uiColor: .systemGray5), lineWidth: 2)
                .frame(width: CGFloat(50), height: CGFloat(100))
            ItemDescriptionView(degree: 30)
        }
        .background(Color.white)
    }
}

struct ResultItemView_Previews: PreviewProvider {
    static var previews: some View {
        ResultItemView(resultImage: UIImage(named: "Pose1")!, degree: 30)
    }
}
