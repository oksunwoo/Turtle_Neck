//
//  VersionView.swift
//  TurtleNeck
//
//  Created by 권나영 on 2022/09/19.
//

import SwiftUI

struct VersionView: View {
    var body: some View {
        VStack {
            Image("LaunchScreenLogo")
                .background(.blue)
            Text(isUpdateAvailable() ? "업데이트 필요" : "최신버전입니다")
            Text("현재 버전: \(currentVersion!)")
        }
    }
}

struct VersionView_Previews: PreviewProvider {
    static var previews: some View {
        VersionView()
    }
}

private extension VersionView {
    var currentVersion: String? {
        let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
        return version
    }
    
    func isUpdateAvailable() -> Bool {
        guard let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String,
              let url = URL(string: "http://itunes.apple.com/lookup?bundleId=com.sunwoo.TurtleNeck"),
              let data = try? Data(contentsOf: url),
              let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any],
              let results = json["results"] as? [[String: Any]],
              results.count > 0,
              let appStoreVersion = results[0]["version"] as? String
        else {
            print("앱 출시 전")
            return false
        }
        if !(version == appStoreVersion) {
            print("업데이트 필요")
            return true
        } else {
            print("최신버전입니다")
            return false
        }
    }
}
