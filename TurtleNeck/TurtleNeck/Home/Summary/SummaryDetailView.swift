//
//  CardView.swift
//  TurtleNeck
//
//  Created by 권나영 on 2022/12/14.
//

import SwiftUI

struct SummaryDetailView: View {
    let summary: Summary
    
    var body: some View {
        VStack {
            HStack {
                ForEach(0..<summary.star, id: \.self) { _ in
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
            }

            Image(summary.imageString)
                .resizable()
                .frame(width: 300, height: 300)
            
            Text(summary.rawValue)
                .font(.largeTitle)
         
            ZStack {
                CardCurve()
                    .foregroundColor(Color("MainGreenColor").opacity(0.8))
                    .frame(height: 300)
                
                VStack(spacing: 10) {
                    Text(summary.shortDescription)
                        .font(.title)
                        .bold()
                    Text(summary.longDescription)
                }
                .foregroundColor(.white)
            }
            .padding(.bottom, -130)
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryDetailView(summary: .perfect)
    }
}
