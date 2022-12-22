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
            ForEach(0..<5, id: \.self) { _ in
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct ResultItemView_Previews: PreviewProvider {
    static var previews: some View {
        ResultItemView(resultImage: UIImage(named: "Pose1")!)
    }
}
