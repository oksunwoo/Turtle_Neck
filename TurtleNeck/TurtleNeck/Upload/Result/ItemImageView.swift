//
//  ItemImageView.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2022/12/22.
//

import SwiftUI

struct ItemImageView: View {
    var resultImage: UIImage
    
    var body: some View {
        VStack (alignment: .leading) {
            Image(uiImage: resultImage)
                .renderingMode(.original)
                .resizable()
                .frame(width: 90, height: 160)
                .cornerRadius(5)
            Image(uiImage: UIImage(named: "TurtleNeckLogo_bk")!)
                .renderingMode(.original)
                .resizable()
                .frame(width: 65, height: 15)
                .cornerRadius(5)
        }
        .padding(.leading, 15)
    }
}

struct ItemImageView_Previews: PreviewProvider {
    static var previews: some View {
        ItemImageView(resultImage: UIImage(named: "Pose1")!)
    }
}
