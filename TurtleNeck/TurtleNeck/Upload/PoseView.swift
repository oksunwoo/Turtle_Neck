//
//  UploadPhotoView.swift
//  TurtleNeck
//
//  Created by 권나영 on 2022/09/28.
//

import SwiftUI
import Photos
import AVFoundation
import ComposableArchitecture

struct PoseView: View {
    let store: StoreOf<PoseCore>
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            NavigationView {
                VStack(spacing: 10) {
                    Text("자세를 정확하게 인식 후 측정하도록 사진을 가이드에 맞춰서 촬영 후 업로드해주세요.")
                        .lineLimit(2)
                        .padding(.horizontal, 25)
                        .padding(.vertical, 15)
                        .foregroundColor(.black.opacity(0.8))
                        .font(.body)
                    
                    Button {
                        viewStore.send(.showAlert)
                    } label: {
                        Text("사진 촬영 가이드 및 유의사항")
                            .foregroundColor(.black.opacity(0.7))
                            .font(.footnote)
                            .frame(width: 200, height: 40)
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                    }
                    .alert(isPresented: viewStore.binding(\.$showAlert),
                           alert: PoseAlert { viewStore.send(.dismissAlert) })
                    
                    VStack(spacing: 20) {
                        Text("전신사진을 등록해주세요").bold()
                        
                        Menu {
                            Button {
                                DispatchQueue.main.async {
                                    viewStore.send(.showAlbum)
                                }
                            } label: {
                                Label("사진 보관함", systemImage: "photo.on.rectangle.angled")
                            }
                            
                            Button {
                                AVCaptureDevice.requestAccess(for: .video) { granted in
                                    if granted {
                                        PHPhotoLibrary.requestAuthorization(for: .readWrite) { status in
                                            switch status {
                                            case .authorized:
                                                DispatchQueue.main.async {
                                                    viewStore.send(.showCamera)
                                                }
                                            default:
                                                DispatchQueue.main.async {
                                                    viewStore.send(.alertButtonTapped)
                                                }
                                            }
                                        }
                                    } else {
                                        DispatchQueue.main.async {
                                            viewStore.send(.alertButtonTapped)
                                        }
                                    }
                                }
                            } label: {
                                Label("사진 찍기", systemImage: "camera")
                            }
                        } label: {
                            if let selectedImage = viewStore.selectedImage {
                                Image(uiImage: selectedImage)
                                    .resizable()
                                    .frame(width: 220, height: 320)
                                    .padding(1)
                                    .overlay(
                                        Rectangle()
                                            .stroke(style: StrokeStyle(lineWidth: 2, dash: [4]))
                                            .foregroundColor(.white))
                            } else {
                                VStack {
                                    Image("camera")
                                        .resizable()
                                        .frame(width: 100, height: 80)
                                    Text("사진추가")
                                        .foregroundColor(.black)
                                        .bold()
                                }
                            }
                        }
                        .sheet(isPresented: viewStore.binding(\.$isImagePickerPresented),
                               content: { ImagePicker(sourceType: viewStore.sourceType,
                                                      image: viewStore.binding(\.$selectedImage))
                        })
                        
                        NavigationLink(destination: IfLetStore(self.store.scope(state: \.optionalResult, action: PoseCore.Action.optionalResult)) {
                            ResultView(store: $0)
                        } else: {
                            ProgressView()
                        }, isActive: viewStore.binding(get: \.isNavigationActive, send: PoseCore.Action.confirmButtonTapped(isNavigationActive:))
                        ) {
                            Text("거북목 측정하기")
                                .foregroundColor(.white)
                                .background(
                                    RoundedRectangle(cornerRadius: 20)
                                        .frame(width: 300, height: 40)
                                        .foregroundColor(viewStore.selectedImage == nil ? .gray.opacity(0.7) : Color("DarkBlue"))
                                )
                        }
                        .disabled(viewStore.selectedImage == nil)
                        .padding(.vertical, 30)
                    }
                    .padding(.top, 30)
                    .frame(maxWidth: .infinity)
                    .background(.gray.opacity(0.2))
                    .padding()
                    Spacer()
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        closeButton()
                    }
                }
                .navigationTitle("거북목 측정")
                .navigationBarTitleDisplayMode(.inline)
                .alert(self.store.scope(state: \.alert), dismiss: .alertDismissed)
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
