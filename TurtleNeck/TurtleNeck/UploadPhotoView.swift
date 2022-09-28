//
//  UploadPhotoView.swift
//  TurtleNeck
//
//  Created by 권나영 on 2022/09/28.
//

import SwiftUI

struct UploadPhotoView: View {
    @Binding var isShowing: Bool
    
    var body: some View {
        VStack() {
            ZStack {
                closeButton()
                Text("자세분석")
                    .font(.title2)
                    .bold()
            }
            Divider()
            HStack {
                Text("주의")
                    .foregroundColor(.gray)
                Spacer()
            }
            noticeImage()
            noticeText()
            selectPhoto()
                .onTapGesture {
                    print("사진선택 기능 구현")
                }
            Spacer()
            Button {
                print("결과분석")
            } label: {
                Text("결과분석하기")
                    .padding()
                    .background(Capsule().strokeBorder())
            }
        }
        .padding()
    }
}

struct UploadPhotoView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPhotoView(isShowing: .constant(true))
    }
}

extension UploadPhotoView {
    func closeButton() -> some View {
        HStack {
            Spacer()
            Button {
                isShowing.toggle()
            } label: {
                Text("x")
                    .font(.largeTitle)
                    .foregroundColor(.gray)
            }
        }
    }
    
    func noticeImage() -> some View {
        HStack {
            ZStack(alignment: .top) {
                GroupBox {
                    Image("Pose1")
                        .resizable()
                        .frame(width: 150, height: 150)
                }
                .padding(.top, 20)
                Text("O")
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(.green)
            }
            ZStack(alignment: .top) {
                GroupBox {
                    Image("Pose2")
                        .resizable()
                        .frame(width: 150, height: 150)
                }
                .padding(.top, 20)
                Text("X")
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(.red)
            }
        }
    }
    
    func noticeText() -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text("* 정확한 자세 분석을 위해 전신을 촬영해주세요")
                Text("* 코, 눈, 귀, 어깨, 팔꿈치, 손목, 골반, 무릎, 발목이 보이게 찍어주세요")
                Text("* 또 다른 주의사항")
            }
            .foregroundColor(.gray)
            .font(.caption)
            
            Spacer()
        }
    }
    
    func selectPhoto() -> some View {
        GroupBox {
            HStack {
                Spacer()
                Image("camera")
                    .resizable()
                    .frame(width: 100, height: 100)
                Spacer()
            }
            Text("사진을 선택해 주세요")
        }
    }
}
