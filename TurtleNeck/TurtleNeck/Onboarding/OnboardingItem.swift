//
//  OnboardingItem.swift
//  TurtleNeck
//
//  Created by 권나영 on 2022/08/26.
//

import SwiftUI

struct OnboardingItem: View {
    let image: String
    let title: String
    
    var body: some View {
        VStack(alignment: .center) {
            Image(systemName: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.white)
           
            Text(title)
                .foregroundColor(.white)
                .font(.largeTitle)
        }
        .frame(width: 250, height: 250)
    }
}

struct OnboardingItem_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingItem(image: "swift", title: "title")
    }
}
