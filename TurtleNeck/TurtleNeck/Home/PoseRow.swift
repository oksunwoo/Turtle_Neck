//
//  PoseRow.swift
//  TurtleNeck
//
//  Created by 권나영 on 2022/12/14.
//

import SwiftUI

struct PoseRow: View {
    let image: String
    let title: String
    let star: Int
    
    var body: some View {
        HStack {
            Image(image)
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            
            Text(title)
            Spacer()
            ForEach(0..<star, id: \.self) { _ in
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct PoseRow_Previews: PreviewProvider {
    static var previews: some View {
        PoseRow(image: "Pose3", title: "훌륭해요", star: 5)
    }
}
