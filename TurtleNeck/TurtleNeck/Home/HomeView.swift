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
            
            VStack() {
                titleView()
                EmptyHomeView()
                    .padding(.top, 150)
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
}
