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
        NavigationView {
            ZStack {
                Color.background.ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 10) {
                        titleView()
                        PoseList(store: store)
                        
                        CollapsibleView {
                            Text("✓ 거북목 증후군은 왜 발생하나요?")
                        } content: {
                            HStack(alignment: .bottom) {
                                Text("거북목증후군의 원인으로는 좋지 않은 자세를 장시간 유지하거나 반복적으로 안 좋은 자세를 취하는 행동에서 유발 됩니다. \n\n작업을 할 때 부족한 휴식 시간 등은 목뼈나 어깨 주위의 근육을 불필요하게 긴장시켜 근육 내의 압력을 증가시키고 통증을 유발합니다.")
                                Image("doctor")
                                    .resizable()
                                    .frame(width: 90, height: 90)
                            }
                        }
                        .padding(.top, 40)
                        
                        CollapsibleView {
                            Text("✓ 어떤 증상이 발생하나요?")
                        } content: {
                            HStack {
                                Text("* 두통과 허리통증이 있습니다. \n* 어깨와 목 주위가 자주 뻐근합니다.  \n* 수면을 방해하며 만성피로를 느끼게 됩니다. \n* 머리 무게 중심이 앞으로 쏠리며 목과 어깨에 지속적인 통증이 있습니다.")
                                Spacer()
                            }
                        }
                        
                        CollapsibleView {
                            Text("✓ 어떻게 예방할 수 있나요?")
                        } content: {
                            VStack(alignment: .leading) {
                                Text("가장 중요한 예방법은 바른 자세를 유지하는 것입니다. 등을 곧게 펴는 자세가 중요합니다.")
                                Text("\n* 컴퓨터를 사용할 때 모니터 상단과 눈높이가 일치하도록 위치시키고 시선이 아래로 15~30도 이내에 머물도록 조정해보세요.")
                                    .foregroundColor(.red)
                            }
                        }
                        .padding(.bottom, 50)
                        Spacer()
                    }
                }
            }
        }
        .accentColor(.blue)
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
        .padding([.top, .leading], 20)
    }
}
