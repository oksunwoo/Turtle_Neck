//
//  LoginView.swift
//  TurtleNeck
//
//  Created by 권나영 on 2022/08/25.
//

import SwiftUI

struct OnboardingView: View {
    @State private var animate = false
    @Binding var isFirstLaunching: Bool
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color.deepBlue.ignoresSafeArea()
            
            VStack(spacing: 20) {
                Image("TurtleNeck")
                    .resizable()
                    .opacity(animate ? 1 : 0)
                    .offset(y: animate ? 0 : 100)
                    .frame(width: 200, height: 200)
                    .animation(.easeOut(duration: 0.6).delay(0.4), value: animate)
                
                Text("거북목 측정하세요")
                    .foregroundColor(.white)
                    .font(.title.weight(.bold))
                    .opacity(animate ? 1 : 0)
                    .offset(y: animate ? 0 : 100)
                    .multilineTextAlignment(.center)
                    .animation(.easeOut(duration: 0.6).delay(0.6), value: animate)
                
                Text("사진인식 후 귀, 어깨, 허리, 엉덩이 등 \n총 17개의 키포인트를 추출하여 자세를 분석해드립니다")
                    .font(.body)
                    .foregroundColor(.white)
                    .opacity(animate ? 1 : 0)
                    .offset(y: animate ? 0 : 100)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black.opacity(0.5))
                    .animation(.easeOut(duration: 0.6).delay(0.8), value: animate)
                
                Button {
                    isFirstLaunching = false
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("시작하기")
                        .bold()
                        .frame(width: 200, height: 40)
                        .foregroundColor(.deepBlue)
                        .background(
                            RoundedRectangle(cornerRadius: 40)
                                .foregroundColor(.white)
                        )
                }
                .padding(.top, 30)
                .opacity(animate ? 1 : 0)
                .offset(y: animate ? 0 : 100)
                .animation(.easeOut(duration: 0.6).delay(1.5), value: animate)
            }
            .padding()
            .onAppear {
                animate.toggle()
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(isFirstLaunching: .constant(true))
    }
}
