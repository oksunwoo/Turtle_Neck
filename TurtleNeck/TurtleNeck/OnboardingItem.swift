//
//  OnboardingItem.swift
//  TurtleNeck
//
//  Created by 권나영 on 2022/08/26.
//

import SwiftUI

struct OnboardingItem: View {
    
    var body: some View {
        VStack {
            Image(systemName: "swift")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.white)
            
            Text("Onboarding Item")
                .foregroundColor(.white)
                .font(.title2)
        }
        .frame(width: 300, height: 300)
        .scaledToFit()
    }
}

struct OnboardingItem_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingItem()
    }
}
