//
//  PoseCore.swift
//  TurtleNeck
//
//  Created by 권나영 on 2022/11/22.
//

import SwiftUI
import ComposableArchitecture

struct PoseState: Equatable {
    @BindableState var selectedImage: UIImage?
    @BindableState var imagePickerPresented = false
}

enum PoseAction: BindableAction, Equatable {
    case binding(BindingAction<PoseState>)
    case showImagePicker
}

struct PoseEnvironment { }

let poseReducer = Reducer<PoseState, PoseAction, PoseEnvironment> { state, action, _ in
    switch action {
    case .binding(_):
        return .none
        
    case .showImagePicker:
        state.imagePickerPresented.toggle()
        return .none
    }
}
.binding()
