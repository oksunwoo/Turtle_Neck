//
//  TempResultView.swift
//  TurtleNeck
//
//  Created by 권나영 on 2023/01/10.
//

import SwiftUI

struct RecordView: View {
    @Binding var show: Bool
    @Binding var data: FetchedResults<User>.Element?
            
    var body: some View {
        ScrollView {
            ZStack {
                Color.background.edgesIgnoringSafeArea(.all)
                VStack {
                    if let data = data {
                        VStack {
                            Image(uiImage: UIImage(data: data.image!)!)
                                .resizable()
                                .frame(width: 300, height: 400)
                                .cornerRadius(10)
                                .padding(.top, 30)
                            
                            ResultDescriptionView(kilogram: Int(data.kilogram), degree: Int(data.degree), grade: Grade(kilogram: Int(data.kilogram)))
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .background(.white)
                                .cornerRadius(10)
                                .padding(.vertical, 20)
                            
                            SolutionView(grade: Grade(kilogram: Int(data.kilogram)))
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
                            .font(.body.weight(.semibold))
                            .frame(height: 35)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(
                                RoundedRectangle(cornerRadius: 30).fill(.black).opacity(0.8)
                            )
                    }
                    .padding(.top, 20)
                }
                .padding()
            }
        }
        .background(Color.background)
    }
}
