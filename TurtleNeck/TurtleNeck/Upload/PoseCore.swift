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
        var sourceType: UIImagePickerController.SourceType = .camera
        var isNavigationActive = false
        var isPoseRequest = false
        var imageData: Data?
        var optionalResult: ResultCore.State?
        var alert: AlertState<Action>?
    }

    enum Action: BindableAction, Equatable {
        case confirmButtonTapped(isNavigationActive: Bool)
        case binding(BindingAction<State>)
        case poseResponse(TaskResult<[Pose]?>)
        case optionalResult(ResultCore.Action)
        case showAlert
        case dismissAlert
        case showAlbum
        case showCamera
        case alertButtonTapped
        case alertDismissed
        case goToSettings
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
                
            case .poseResponse(.success(let response)):
                let degree = calculateDegree(pose: response!)
                let score = calculateScore(with: degree)
                let validity = calculateValidity(pose: response!)
                
                state.isPoseRequest = false
                state.optionalResult = ResultCore.State(resultImage: state.selectedImage!, degree: degree, score: score, validity: validity, isPoseNil: response!.count == 0)
                
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
                
            case .showAlbum:
                state.sourceType = .photoLibrary
                state.isImagePickerPresented.toggle()
                return .none
                
            case .showCamera:
                state.sourceType = .camera
                state.isImagePickerPresented.toggle()
                return .none
                
            case .alertButtonTapped:
                state.alert = AlertState(
                    title: TextState("접근권한 확인"),
                    message: TextState("사진 및 카메라 접근을 허용해주세요"),
                    buttons: [
                        .default(TextState("설정으로 이동"), action: .send(.goToSettings)),
                        .cancel(TextState("확인"))
                    ]
                )
                return .none
                
            case .alertDismissed:
                state.alert = nil
                return .none
                
            case .goToSettings:
                guard let settingURL = URL(string: UIApplication.openSettingsURLString),
                      UIApplication.shared.canOpenURL(settingURL) else {
                    return .none
                }
                UIApplication.shared.open(settingURL, options: [:])
                return .none
            }
        }
        .ifLet(\.optionalResult, action: /Action.optionalResult) {
            ResultCore()
        }
    }
}
