//
//  ResultItemView.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2022/12/22.
//

import SwiftUI

struct ResultItemView: View {
    var resultImage: UIImage
    
    var body: some View {
        HStack {
            ItemImageView(resultImage: resultImage)
            VerticalLine()
                .stroke(Color(uiColor: .systemGray5), lineWidth: 2)
                .frame(width: CGFloat(50), height: CGFloat(100))
            ItemDescriptionView()
        }
    }
}

struct ResultItemView_Previews: PreviewProvider {
    static var previews: some View {
        ResultItemView(resultImage: UIImage(named: "Pose1")!)
    }
}
