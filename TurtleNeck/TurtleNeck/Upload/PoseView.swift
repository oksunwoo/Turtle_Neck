//
//  UploadPhotoView.swift
//  TurtleNeck
//
//  Created by 권나영 on 2022/09/28.
//

import SwiftUI
import ComposableArchitecture

struct PoseView: View {
    let store: StoreOf<PoseCore>
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            NavigationView {
                VStack {
                    Text("자세를 정확하게 인식 후 측정하도록 사진을 가이드에 맞춰서 촬영 후 업로드해주세요.")
                        .lineLimit(2)
                        .padding(.horizontal, 50)
                        .foregroundColor(.black.opacity(0.9))
                        .font(.body)
                    
                    Button {
                        viewStore.send(.showAlert)
                    } label: {
                        Text("사진 촬영 가이드 및 유의사항")
                            .foregroundColor(.black.opacity(0.7))
                            .font(.caption)
                            .frame(width: 200, height: 40)
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                    }
                    .alert(isPresented: viewStore.binding(\.$showAlert), alert: PoseAlert { viewStore.send(.dismissAlert) })
                    
                    Button {
                        viewStore.send(.showImagePicker)
                    } label: {
                        Text("사진 선택하기")
                    }
                    .sheet(isPresented: viewStore.binding(\.$isImagePickerPresented),
                           content: {
                        ImagePicker(image: viewStore.binding(\.$selectedImage))
                    })
                    
                    if let selectedImage = viewStore.selectedImage {
                        Spacer()
                        Image(uiImage: selectedImage)
                            .resizable()
                            .frame(width: 180, height: 320)
                        Spacer()
                    } else {
                        Spacer()
                        Image("camera")
                            .resizable()
                            .frame(width: 150, height: 120)
                        Spacer()
                    }
                    
                    NavigationLink(destination: IfLetStore(self.store.scope(state: \.optionalResult, action: PoseCore.Action.optionalResult)) {
                        ResultView(store: $0)
                    } else: {
                        ProgressView()
                    }, isActive: viewStore.binding(get: \.isNavigationActive, send: PoseCore.Action.confirmButtonTapped(isNavigationActive:))
                    ) {
                        Text("분석하기")
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        closeButton()
                    }
                }
                .navigationTitle("거북목 측정")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct PoseView_Previews: PreviewProvider {
    static var previews: some View {
        PoseView(
            store: Store(
                initialState: PoseCore.State(),
                reducer: PoseCore()
            )
        )
    }
}

extension PoseView {
    func closeButton() -> some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Text("x")
                .font(.largeTitle)
                .foregroundColor(.black)
        }
    }
}
