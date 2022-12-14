//
//  HomeView.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2022/08/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color("BackgroundColor")
                    .ignoresSafeArea()
                
                VStack(spacing: 10) {
                    titleView()
                    categoryView()
                    listView()
                        .padding(.top, 15)
                    Spacer()
                }
            }
        }
        .accentColor(.blue)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
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
                        ResultView()
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
    
    func listView() -> some View {
        List {
            Section {
                NavigationLink(destination: Text("훌륭한 자세 보여주기")) {
                    PoseRow(image: "Pose3", title: "훌륭해요", star: 5)
                }
                
                NavigationLink(destination: Text("덜 훌륭한 자세 보여주기")) {
                    PoseRow(image: "Pose2", title: "좋아요", star: 3)
                }
                
                NavigationLink(destination: Text("아쉬운 자세 보여주기")) {
                    PoseRow(image: "Pose4", title: "아쉬워요", star: 1)
                }
            } header: {
                Text("Criteria").font(.headline).foregroundColor(.black)
            }
        }
        .listStyle(InsetGroupedListStyle())
    }
}
