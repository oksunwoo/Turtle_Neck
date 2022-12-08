//
//  PoseClient.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2022/12/08.
//

import Foundation
import ComposableArchitecture

struct PoseClient {
    var fetch: @Sendable (Data) async throws -> String
}

extension DependencyValues {
    var poseClient: PoseClient {
        get { self[PoseClient.self] }
        set { self[PoseClient.self] = newValue }
    }
}

extension PoseClient: DependencyKey {
    static let liveValue = PoseClient(fetch: { imageData in
        var request = URLRequest(url: URL(string: "https://cv-api.kakaobrain.com/pose")!)
        let boundary = UUID().uuidString
        let headers: [String: String] = ["Content-Type": "multipart/form-data; boundary=\(boundary)", "Authorization": ""]
        
        request.httpMethod = "POST"
        headers.forEach { (key, value) in
            request.setValue(value, forHTTPHeaderField: key)
        }
        
        var body = Data()
        body.append("--\(boundary)\r\n".data(using: .utf8)!)
        body.append("Content-Disposition: form-data; name=\"file\"; filename=\"toni\"\r\n".data(using: .utf8)!)
        body.append("Content-Type: toni\r\n\r\n".data(using: .utf8)!)
        body.append(imageData)
        body.append("\r\n".data(using: .utf8)!)
        body.append("--\(boundary)--\r\n".data(using: .utf8)!)
        request.httpBody = body
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        return String(decoding: data, as: UTF8.self)
    })
}
