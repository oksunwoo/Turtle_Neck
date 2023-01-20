//
//  RecordList.swift
//  TurtleNeck
//
//  Created by 권나영 on 2023/01/07.
//

import SwiftUI
import ComposableArchitecture

struct RecordList: View {
    @FetchRequest(
        entity: User.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \User.date, ascending: false)
        ]
    ) var userData: FetchedResults<User>
    
    @State var show = false
    @State var selected: FetchedResults<User>.Element?
    
    var body: some View {
        
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
                            Button {
                                show.toggle()
                                selected = data
                            } label: {
                                RecordItem(
                                    image: UIImage(data: data.image!) ?? UIImage(),
                                    score: data.score,
                                    grade: Grade(score: Int(data.score))
                                )
                            }
                            .fullScreenCover(isPresented: $show) {
                                RecordView(show: $show, data: $selected)
                            }
                        }
                    }
                }
                .frame(height: 185)
            }
        }
    }
}

struct PoseList_Previews: PreviewProvider {
    static var previews: some View {
        RecordList()
    }
}
