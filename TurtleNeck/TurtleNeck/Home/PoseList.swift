//
//  PoseList.swift
//  TurtleNeck
//
//  Created by 권나영 on 2023/01/07.
//

import SwiftUI
import ComposableArchitecture

struct PoseList: View {
    let store: StoreOf<HomeCore>
    
    @FetchRequest(
        entity: User.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \User.date, ascending: false)
        ]
    ) var userData: FetchedResults<User>

    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
        
            if userData.count == 0 {
                VStack(alignment: .center) {
                    Image("Pose3")
                        .resizable()
                        .frame(width: 150, height: 150)
                        .padding(.vertical, 30)
                    
                    Text("분석을 통해 내가 거북목인지 알아보세요!")
                }
            } else {
                VStack(alignment: .leading, spacing: 30) {
                    Text("지난 기록들")
                        .font(.headline)
                        .padding(.leading, 30)
                        .padding(.top, 5)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(alignment: .top, spacing: 0) {
                            ForEach(userData) { data in
                                
                                NavigationLink(destination:  IfLetStore(self.store.scope(state: \.optionalResult, action: HomeCore.Action.optionalResult)) {
                                    ResultView(store: $0)
                                    
                                }, isActive: viewStore.binding(get: \.isNavigationActive, send: HomeCore.Action.poseItemTapped(isNavigationActive: true, data: data))) {
                                    
                                    // label
                                    PoseItem(
                                        image: UIImage(data: data.image!) ?? UIImage(),
                                        score: data.score,
                                        grade: Grade(score: Int(data.score))
                                    )
                                }
                            }
                        }
                    }
                    .frame(height: 185)
                }
            }
        }
    }
}

struct PoseList_Previews: PreviewProvider {
    static var previews: some View {
        PoseList(
            store: Store(
                initialState: HomeCore.State(),
                reducer: HomeCore()
            )
        )
    }
}
