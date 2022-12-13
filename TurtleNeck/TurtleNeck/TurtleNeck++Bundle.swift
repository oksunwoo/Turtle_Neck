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
            return KeychainError.failedToGetAccountID.errorDescription
        }
        
        return key
    }
}


