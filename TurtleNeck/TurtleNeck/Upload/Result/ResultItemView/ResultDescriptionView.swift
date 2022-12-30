//
//  ResultDescriptionView.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2022/12/30.
//

import SwiftUI

struct ResultDescriptionView: View {
    let degree: Double
    
    var body: some View {
        Text("측정 결과 목의 각도가 \n\(Int(round(degree)))º 기울어져 있습니다.")
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity)
    }
}

struct ResultDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        ResultDescriptionView(degree: 30)
    }
}
