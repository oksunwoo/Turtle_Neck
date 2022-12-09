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
        var photoData: Data?
        var isPhotoRequest = false
    }

    enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)
        case showImagePicker
    }
    
    var body: some ReducerProtocol<State, Action> {
        BindingReducer()
        Reduce { state, action in
            switch action {
            case .binding(_):
                return .none
                
            case .showImagePicker:
                state.isImagePickerPresented.toggle()
                return .none
            }
        }
    }
}
