//
//  HomeView.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2022/08/26.
//

import SwiftUI
import ComposableArchitecture

struct HomeView: View {
    let store: StoreOf<HomeCore>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            NavigationView {
                ZStack {
                    Color("BackgroundColor")
                        .ignoresSafeArea()
                    
                    VStack(spacing: 10) {
                        titleView()
                        categoryView()
                        SummaryView(
                            store: self.store.scope(
                                state: \.summary,
                                action: HomeCore.Action.summary
                            )
                        )
                    }
                }
            }
            .accentColor(.blue)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(
            store: Store(
                initialState: HomeCore.State(),
                reducer: HomeCore()
            )
        )
    }
}

extension HomeView {
    func titleView() -> some View {
        HStack {
            Image("TurtleNeckLogo_bk")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 250, height: 50)
            Spacer()
        }
        .padding(.top, 40)
    }
    
    func categoryView() -> some View {
        VStack(alignment: .leading, spacing: 30) {
            Text("지난 기록들")
                .font(.headline)
                .padding(.leading, 30)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    NavigationLink {
                        ResultFailView()
                    } label: {
                        VStack(alignment: .center, spacing: 3) {
                            poseItem()
                            Text("2022.12.14")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        
                        VStack(alignment: .center, spacing: 3) {
                            poseItem()
                            Text("2022.12.14")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
    
    func poseItem() -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .frame(width: 130, height: 220)
                .foregroundColor(.white)
                
            
            VStack(alignment: .leading, spacing: 2) {
                Image("Pose2")
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 100, height: 155)
                    .cornerRadius(30)
                
                Text("87점")
                    .foregroundColor(.primary)
                    .font(.caption)
                    .padding(.top, 5)
                
                Text("훌륭해요")
                    .foregroundColor(.secondary)
                    .font(.caption)
            }
        }
        .padding(.leading, 15)
    }
}
