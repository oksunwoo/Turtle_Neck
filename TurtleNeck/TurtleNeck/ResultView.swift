//
//  ResultView.swift
//  TurtleNeck
//
//  Created by 권나영 on 2022/09/29.
//

import SwiftUI

struct ResultView: View {
    @State private var taskCompleted = false
    
    var body: some View {
        ProgressView("결과 분석중...")
            .tint(.orange)
            .padding()
            .progressViewStyle(.circular)

            .navigationTitle("분석결과")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
    }
}
