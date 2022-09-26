//
//  LoginView.swift
//  TurtleNeck
//
//  Created by 권나영 on 2022/08/25.
//

import SwiftUI

struct OnboardingView: View {
    @Binding var isFirstLaunching: Bool
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack() {
            HStack(alignment: .center) {
                Image("LaunchScreenLogo")
                    .resizable()
                    .frame(width: 300, height: 50)
                    .padding(.top, 60)
            }
            
            TabView {
                OnboardingItem(image: "tortoise.fill", title: "당신은 거북이")
                OnboardingItem(image: "person.fill.questionmark", title: "인가요?")
                OnboardingItem(image: "hand.point.right.fill", title: "알아보러 갑시다")
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            
            HStack {
                Spacer()
                Button {
                    isFirstLaunching = false
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("둘러보기")
                        .font(.body)
                        .foregroundColor(.white)
                        .underline()
                }
                .padding()
            }
        }
        .background(Color("MainGreenColor"))
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(isFirstLaunching: .constant(true))
    }
}
