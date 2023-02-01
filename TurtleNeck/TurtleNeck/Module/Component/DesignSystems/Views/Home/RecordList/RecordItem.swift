//
//  RecordItem.swift
//  TurtleNeck
//
//  Created by 권나영 on 2023/01/07.
//

import SwiftUI

struct RecordItem: View {
    let image: UIImage
    let kilogram: Int32
    let grade: Grade
    let date: Date
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .frame(width: 130, height: 200)
                .foregroundColor(.white)
            
            
            VStack(alignment: .leading, spacing: 2) {
                Image(uiImage: image)
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 100, height: 155)
                    .cornerRadius(30)
                
                Text(Date(), style: .date)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .padding(.top, 8)
            }
        }
        .padding(.leading, 15)
    }
}

struct PoseItem_Previews: PreviewProvider {
    static var previews: some View {
        RecordItem(
            image: UIImage(imageLiteralResourceName: "Pose1"),
            kilogram: 32,
            grade: .dangerous,
            date: Date()
        )
    }
}
