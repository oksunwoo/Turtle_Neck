//
//  TurtleNeck++Bundle.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2022/12/09.
//

import Foundation

extension Bundle {
    var apikey: String {
        guard let file = self.path(forResource: "PoseInfo", ofType: "plist") else {
            return ""
        }
        
        guard let resource = NSDictionary(contentsOfFile: file) else {
            return ""
        }
        
        guard let key = resource["API_KEY"] as? String else {
            fatalError("PoseInfo.plist에 API_KEY 설정을 확인해주세요.")
        }
        
        return key
    }
}


