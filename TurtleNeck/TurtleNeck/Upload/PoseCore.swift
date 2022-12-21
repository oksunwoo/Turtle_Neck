//
//  PoseCore.swift
//  TurtleNeck
//
//  Created by 권나영 on 2022/11/22.
//

import SwiftUI
import ComposableArchitecture

struct PoseCore: ReducerProtocol {
    struct State: Equatable {
        @BindableState var selectedImage: UIImage?
        @BindableState var isImagePickerPresented = false
        @BindableState var showAlert = false
        var isNavigationActive = false
        var isPoseRequest = false
        var imageData: Data?
        var optionalResult: ResultCore.State?
    }

    enum Action: BindableAction, Equatable {
        case confirmButtonTapped(isNavigationActive: Bool)
        case binding(BindingAction<State>)
        case showImagePicker
        case poseResponse(TaskResult<[Pose]?>)
        case optionalResult(ResultCore.Action)
        case showAlert
        case dismissAlert
    }
    
    @Dependency (\.poseClient) var poseClient
    private enum CancelID {}
    
    var body: some ReducerProtocol<State, Action> {
        BindingReducer()
        Reduce { state, action in
            switch action {
            case .confirmButtonTapped(isNavigationActive: true):
                state.isPoseRequest = true
                state.isNavigationActive = true
                state.imageData = state.selectedImage?.jpegData(compressionQuality: 1)
                
                return .task { [imageData = state.imageData] in
                    await .poseResponse(TaskResult {
                        try await self.poseClient.fetch(imageData ?? Data())
                    })
                }
                
            case .confirmButtonTapped(isNavigationActive: false):
                state.isNavigationActive = false
                state.optionalResult = nil
                return .cancel(id: CancelID.self)
                
            case .binding(\.$selectedImage):
                state.selectedImage = state.selectedImage?.downSample(size: CGSize(width: 100, height: 300))
                return .none
                
            case .binding:
                return .none
                
            case .showImagePicker:
                state.isImagePickerPresented.toggle()
                return .none
                
            case .poseResponse(.success(let response)):
                state.isPoseRequest = false
                state.optionalResult = ResultCore.State(resultImage: state.selectedImage!, pose: response!)
                return .none
                
            case .poseResponse(.failure):
                state.isPoseRequest = false
                return .none
                
            case .optionalResult:
                return .none
                
            case .showAlert:
                state.showAlert.toggle()
                return .none
                
            case .dismissAlert:
                state.showAlert.toggle()
                return .none
            }
        }
        .ifLet(\.optionalResult, action: /Action.optionalResult) {
            ResultCore()
        }
    }
}
