//
//  HomeView.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2022/08/26.
//

import SwiftUI

struct HomeView: View {
    let urlString = "https://health.kdca.go.kr/healthinfo/biz/health/ntcnInfo/healthSourc/thtimtCntnts/thtimtCntntsView.do?thtimt_cntnts_sn=33"
    @State var showSafari = false
    
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 10) {
                    titleView()
                    RecordList(selected: nil)
                    
                    CollapsibleView {
                        Text("✓ 거북목 증후군의 원인은 무엇인가요?")
                            .bold()
                            .font(.subheadline)
                    } content: {
                        VStack() {
                            HStack(spacing: 30) {
                                VStack {
                                    Text("정상자세")
                                    Image("Good")
                                        .resizable()
                                        .frame(width: 100, height: 90)
                                }
                                Text("VS")
                                VStack {
                                    Text("거북목 자세")
                                    Image("Bad")
                                        .resizable()
                                        .frame(width: 100, height: 90)
                                }
                            }
                            Text("스마트폰이나 컴퓨터의 과사용이 1차 원인이 되고 있습니다. 바르지 못한 자세로 오랫동안 앉아 있거나 생활하는 것이 제일 큰 원인입니다.")
                        }
                    }
                    .padding(.top, 40)
                    
                    CollapsibleView {
                        Text("✓ 어떤 증상이 발생하나요?")
                            .bold()
                            .font(.subheadline)
                    } content: {
                        VStack(spacing: 6) {
                            HStack {
                                Text("* 목덜미와 어깻죽지가 뻐근합니다. \n* 팔도 저리고, 시리고, 근육 속이 아픈 통증이 생깁니다  \n* 수면을 방해하며 만성피로를 느끼게 됩니다. ")
                                Spacer()
                            }
                            Text("방사통이 심해 잠을 이루기 힘들거나 팔 힘이 약해지는 증상이 생기면 빨리 전문의의 진찰을 받아야 합니다.")
                                .foregroundColor(.red)
                        }
                    }
                    
                    CollapsibleView {
                        Text("✓ 어떻게 예방할 수 있나요?")
                            .bold()
                            .font(.subheadline)
                    } content: {
                        HStack {
                            Text("* 모니터 높이를 높이기 \n* 운전 중 요추 경추 전만 유지하기 \n* 스마트폰을 볼 경우, 무조건 높이 들기 \n* 서거나 걸을 때 허리를 꼿꼿이 유지하기")
                            Spacer()
                        }
                    }
                    .padding(.bottom, 10)
                    
                    VStack(alignment: .leading, spacing: 3) {
                        Text("데이터 결과는 참조용으로 의료기기의 데이터 기반이 될 수 없습니다. 진단 및 치료에 대한 결정은 의사 및 기타 의료 전문가의 조언을 구하세요.")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                        HStack {
                            Text("자세한 사항은")
                                .foregroundColor(.gray)
                            Button {
                                self.showSafari = true
                            } label: {
                                Text("여기를")
                                    .underline()
                                    .foregroundColor(.blue)
                            }
                            .sheet(isPresented: $showSafari) {
                                SafariView(url: URL(string: urlString)!)
                            }
                            Text("클릭하여 확인할 수 있습니다.")
                                .foregroundColor(.gray)
                        }
                        .font(.caption)
                    }
                    .padding(.horizontal, 10)
                    Spacer()
                }
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
            Image("TurtleNeckLogo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 75)
        }
    }
}



