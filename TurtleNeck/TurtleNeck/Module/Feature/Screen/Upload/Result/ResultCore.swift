//
//  ResultCore.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2022/12/19.
//

import SwiftUI
import CoreData
import ComposableArchitecture

struct ResultCore: ReducerProtocol {
    struct State: Equatable {
        var resultImage: UIImage
        var degree: Double
        var score: Int
        var validity: Double
        var isPoseNil = true
    }
    
    enum Action: Equatable {
        case saveData(in: NSManagedObjectContext)
    }
    
    var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case .saveData(in: let context):
                let user = User(context: context)
                user.score = Int32(state.score)
                user.image = state.resultImage.pngData()
                user.degree = state.degree
                user.validity = state.validity
                user.date = Date()
                
                DataManager.shared.saveContext()
                return .none
            }
        }
    }
}
