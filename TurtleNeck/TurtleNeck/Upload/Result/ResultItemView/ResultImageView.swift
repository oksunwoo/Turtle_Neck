//
//  ItemImageView.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2022/12/22.
//

import SwiftUI

struct ResultImageView: View {
    let resultImage: UIImage
    
    var body: some View {
        VStack (alignment: .leading) {
            Image(uiImage: resultImage)
                .renderingMode(.original)
                .resizable()
                .cornerRadius(15)
                .frame(width: 90, height: 160)
                .padding(.all, 10)
        }
    }
}

struct ResultImageView_Previews: PreviewProvider {
    static var previews: some View {
        ResultImageView(resultImage: UIImage(named: "Pose1")!)
    }
}
