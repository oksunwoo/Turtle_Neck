//
//  PoseAlert.swift
//  TurtleNeck
//
//  Created by 권나영 on 2022/12/20.
//

import SwiftUI

struct PoseAlert: View {
    let action: () -> Void
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.3).ignoresSafeArea()
            
            VStack(alignment: .leading) {
                HStack {
                    Text("사진 촬영 가이드 및 유의사항")
                    Spacer()
                    Button("x") {
                        action()
                    }
                }
                .font(.title3)
                .foregroundColor(.black)
                
                HStack {
                    Image("Pose6")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Image("Pose7")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("* 정확하게 보이도록 밝고 선명하게 촬영해주세요.")
                    Text("* 자세를 정확하게 분석하기 위해 좌측 혹은 우측을 보고 촬영해주세요.")
                }
                .font(.caption)
                
                Button(action: action) {
                    Text("확인")
                        .foregroundColor(.white)
                        .font(.body)
                        .frame(height: 35)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 30).fill(.black).opacity(0.8)
                        )
                }
            }
            .padding(.horizontal, 12)
            .padding(.vertical)
            .background(.white)
            .cornerRadius(10)
            .padding()
        }
    }
}

struct PoseAlert_Previews: PreviewProvider {
    static var previews: some View {
        PoseAlert { }
    }
}
