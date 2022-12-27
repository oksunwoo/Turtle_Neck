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
        ZStack {
            Color("DeepBlue").ignoresSafeArea()
            
            VStack(spacing: 20) {
                Image("TurtleNeck")
                    .resizable()
                    .frame(width: 200, height: 200)
                
                Text("거북목측정하세요")
                    .bold()
                    .font(.title)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                
                Text("사진인식 후 귀, 어깨, 허리, 엉덩이 등 \n총 17개의 키포인트를 추출하여 자세를 분석해드립니다")
                    .font(.body)
                    .foregroundColor(.white)
                    .foregroundColor(.black.opacity(0.5))
                    .multilineTextAlignment(.center)
                
                Button {
                    isFirstLaunching = false
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("시작하기")
                        .bold()
                        .frame(width: 200, height: 40)
                        .foregroundColor(Color("DeepBlue"))
                        .background(
                            RoundedRectangle(cornerRadius: 40)
                                .foregroundColor(.white)
                        )
                }
                .padding(.top, 30)
            }
            .padding()
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(isFirstLaunching: .constant(true))
    }
}
