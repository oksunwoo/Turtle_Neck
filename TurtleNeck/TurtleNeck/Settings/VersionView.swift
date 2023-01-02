//
//  VersionView.swift
//  TurtleNeck
//
//  Created by 권나영 on 2022/09/19.
//

import SwiftUI

struct VersionView: View {
    @State private var needUpdate = false
    private var currentVersion: String? {
        let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
        return version
    }
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            VStack {
                Image("TurtleNeckLogo_bk")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 80)
                Text(needUpdate ? "업데이트 필요." : "최신버전입니다.")
                Text("현재 버전: \(currentVersion!)")
            }
            .onAppear {
                checkVersion { appStoreVersion in
                    needUpdate = appStoreVersion != currentVersion
                }
            }
        }
    }
}

struct VersionView_Previews: PreviewProvider {
    static var previews: some View {
        VersionView()
    }
}

private extension VersionView {
    func checkVersion(completionHandler: @escaping (String?) -> Void) {
        guard let url = URL(string: "http://itunes.apple.com/lookup?bundleId=com.sunwoo.TurtleNeck") else {
            print("앱 출시 전")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil,
                  let statusCode = (response as? HTTPURLResponse)?.statusCode,
                  statusCode >= 200 && statusCode < 300 else {
                return
            }
            
            guard let data = data,
                  let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any],
                  let results = json["results"] as? [[String: Any]], results.count > 0 else {
                return
            }
            let appStoreVersion = results[0]["version"] as? String
            completionHandler(appStoreVersion)
        }
        .resume()
    }
}
