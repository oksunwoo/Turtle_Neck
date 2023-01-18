//
//  PoseItem.swift
//  TurtleNeck
//
//  Created by 권나영 on 2023/01/07.
//

import SwiftUI

struct PoseItem: View {
    let image: UIImage
    let score: Int32
    let grade: Grade
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .frame(width: 130, height: 220)
                .foregroundColor(.white)
            
            
            VStack(alignment: .leading, spacing: 2) {
                Image(uiImage: image)
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 100, height: 155)
                    .cornerRadius(30)
                
                Text("\(score) 점")
                    .foregroundColor(.primary)
                    .font(.caption)
                    .padding(.top, 5)
                
                Text(grade.shortDescription)
                    .foregroundColor(.secondary)
                    .font(.caption)
            }
        }
        .padding(.leading, 15)
    }
}

struct PoseItem_Previews: PreviewProvider {
    static var previews: some View {
        PoseItem(
            image: UIImage(imageLiteralResourceName: "Pose1"),
            score: 32,
            grade: .dangerous
        )
    }
}
