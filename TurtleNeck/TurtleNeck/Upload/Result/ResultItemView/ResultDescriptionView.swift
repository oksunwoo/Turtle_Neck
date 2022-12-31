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
        Text("목의 각도가 \(Int(round(degree)))º 기울었어요.")
            .bold()
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity)
    }
}

struct ResultDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        ResultDescriptionView(degree: 30)
    }
}
