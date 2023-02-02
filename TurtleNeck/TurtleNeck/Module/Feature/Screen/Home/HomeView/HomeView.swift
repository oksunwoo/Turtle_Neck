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
            
            VStack(spacing: 10) {
                titleView()
                RecordList(selected: nil)
                
                Spacer()
                
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
                .padding(.bottom, 40)
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



