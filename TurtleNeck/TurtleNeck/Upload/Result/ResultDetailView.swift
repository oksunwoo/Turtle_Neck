//
//  TempResultView.swift
//  TurtleNeck
//
//  Created by 권나영 on 2023/01/10.
//

import SwiftUI

struct ResultDetailView: View {
    @Binding var show: Bool
    @Binding var data: FetchedResults<User>.Element?
            
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            
            VStack {
                if let data = data {
                    ScoreView(score: Int(data.score))
                        .padding(.bottom, 50)
                    VStack {
                        ResultItemView(resultImage: UIImage(data: data.image!)!, score: Int(data.score), degree: data.degree, validity: data.validity)
                            .cornerRadius(10)
                            .padding(.bottom, 10)
                        SolutionView(grade: Grade(score: Int(data.score)))
                            .cornerRadius(10)
                    }
                    .frame(width: 350)
                    .shadow(radius: 3, y: 3)
                    .fixedSize(horizontal: true, vertical: true)
                }
                
                Button {
                    withAnimation(.spring()) {
                        show.toggle()
                    }
                } label: {
                    Text("닫기")
                        .foregroundColor(.white)
                        .font(.body)
                        .frame(height: 35)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 30).fill(.black).opacity(0.8)
                        )
                }
                .padding(.top, 20)
            }
//            .frame(minHeight: 0, maxHeight: .infinity)
//            .fixedSize(horizontal: false, vertical: true)
            .padding()
        }
    }
}

//struct ResultDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ResultDetailView(show: .constant(true), data: nil)
//    }
//}
