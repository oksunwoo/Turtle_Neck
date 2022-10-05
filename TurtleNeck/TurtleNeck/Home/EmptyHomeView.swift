//
//  EmptyHomeView.swift
//  TurtleNeck
//
//  Created by 권나영 on 2022/10/05.
//

import SwiftUI

struct EmptyHomeView: View {
    let emptyHomeImage = ["emptyHome1", "emptyHome2", "emptyHome3"]
    @State private var isShowing = false
    
    var body: some View {
        VStack(alignment: .center) {
            Image(emptyHomeImage.randomElement()!)
                .resizable()
                .frame(width: 100, height: 100)
            
            VStack(alignment: .center) {
                Text("분석을 통해")
                Text("내가 거북목인지 알아보세요!")
            }
            .foregroundColor(.gray)
            Button {
                isShowing.toggle()
            } label: {
                Text("+ 검사하러 가기")
                    .foregroundColor(.white)
            }
            .buttonStyle(.borderedProminent)
            .fullScreenCover(isPresented: $isShowing) {
                UploadImageView(isShowing: $isShowing)
            }
        }
    }
}

struct EmptyHomeView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyHomeView()
    }
}
