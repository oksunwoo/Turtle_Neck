//
//  UploadPhotoView.swift
//  TurtleNeck
//
//  Created by 권나영 on 2022/09/28.
//

import SwiftUI
import ComposableArchitecture

struct PoseView: View {
    let store: Store<PoseState, PoseAction>
    
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
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
                    .padding(.leading, 12)
                Spacer()
            }
            noticeImage()
            noticeText()
            
            VStack {
                Button {
                    viewStore.send(.showImagePicker)
                } label: {
                    Text("사진 선택하기")
                }
                .sheet(isPresented: viewStore.binding(\.$imagePickerPresented),
                       content: {
                    ImagePicker(image: viewStore.binding(\.$selectedImage))
                })
                
                if let selectedImage = viewStore.selectedImage {
                    Spacer()
                    Image(uiImage: selectedImage)
                        .resizable()
                        .frame(width: 200, height: 300)
                    Spacer()
                } else {
                    Spacer()
                    Image("camera")
                        .resizable()
                        .frame(width: 150, height: 120)
                    Spacer()
                }
                
                Button {
                    print("카카오포즈 api 연결")
                } label: {
                    Text("분석하기")
                }
            }
        }
    }
}

struct PoseView_Previews: PreviewProvider {
    static var previews: some View {
        PoseView(
            store: Store(
                initialState: PoseState(),
                reducer: poseReducer,
                environment: PoseEnvironment()
            )
        )
    }
}

extension PoseView {
    func closeButton() -> some View {
        HStack {
            Spacer()
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("x")
                    .font(.largeTitle)
                    .foregroundColor(.gray)
                    .padding(.trailing, 12)
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
            .padding(.leading, 12)
            .foregroundColor(.gray)
            .font(.caption)
            Spacer()
        }
    }
}
