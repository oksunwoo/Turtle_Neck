//
//  HomeView.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2022/08/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            VStack(spacing: 10) {
                titleView()
                listView()
                    .padding(.top, 15)
                Spacer()
            }
        }
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
    
    func listView() -> some View {
        List {
            Section {
                poseItem(image: "Pose3", title: "훌륭해요", star: 5)
                poseItem(image: "Pose2", title: "좋아요", star: 3)
                poseItem(image: "Pose4", title: "아쉬워요", star: 1)
            } header: {
                Text("Criteria").font(.headline).foregroundColor(.black)
            }
        }
    }
    
    func poseItem(image: String, title: String, star: Int) -> some View {
        HStack {
            Image(image)
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            
            Text(title)
            Spacer()
            ForEach(0..<star) { _ in
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}
