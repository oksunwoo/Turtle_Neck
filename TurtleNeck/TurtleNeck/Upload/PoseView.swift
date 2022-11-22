//
//  UploadPhotoView.swift
//  TurtleNeck
//
//  Created by 권나영 on 2022/09/28.
//

import SwiftUI

struct PoseView: View {
    @Binding var isShowing: Bool
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    @State private var imagePickerPresented = false
    
    var body: some View {
        NavigationView {
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
                        imagePickerPresented.toggle()
                    }
                    .sheet(isPresented: $imagePickerPresented,
                           onDismiss: loadImage,
                           content: { ImagePicker(image: $selectedImage) })
                Spacer()
                NavigationLink {
                    ResultView()
                } label: {
                    Text("결과분석하기")
                        .padding()
                        .background(Capsule().strokeBorder())
                }
            }
            .padding()
            .navigationBarHidden(true)
        }
    }
}

struct UploadPhotoView_Previews: PreviewProvider {
    static var previews: some View {
        PoseView(isShowing: .constant(true))
    }
}

extension PoseView {
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
                .padding([.top, .leading])
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
                .padding([.top, .trailing])
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
                if profileImage == nil {
                    Image("camera")
                        .resizable()
                        .frame(width: 100, height: 100)
                } else {
                    profileImage!
                        .resizable()
                        .frame(width: 100, height: 100)
                }
                Spacer()
            }
            Text(profileImage == nil ? "사진을 선택해 주세요" : "다시 선택하기")
        }
        .padding(.horizontal)
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else {
            return
        }
        profileImage = Image(uiImage: selectedImage)
    }
}
