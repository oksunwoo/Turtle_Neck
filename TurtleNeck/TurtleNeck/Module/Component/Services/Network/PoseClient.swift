//
//  PoseClient.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2022/12/08.
//

import Foundation
import ComposableArchitecture

struct PoseClient {
    var fetch: @Sendable (Data) async throws -> Pose
}

extension DependencyValues {
    var poseClient: PoseClient {
        get { self[PoseClient.self] }
        set { self[PoseClient.self] = newValue }
    }
}

extension PoseClient: DependencyKey {
    static let liveValue = PoseClient(fetch: { imageData in
        var request = URLRequest(url: URL(string: "https://naveropenapi.apigw.ntruss.com/vision-pose/v1/estimate")!)
        let boundary = UUID().uuidString
        let headers: [String: String] = ["Content-Type": "multipart/form-data; boundary=\(boundary)", "X-NCP-APIGW-API-KEY-ID": "w92ufql61z", "X-NCP-APIGW-API-KEY": "68GItkwnv9Jw6t42NLT4ym5u7GlTjP39itI8JHuS"]
        
        request.httpMethod = "POST"
        headers.forEach { (key, value) in
            request.setValue(value, forHTTPHeaderField: key)
        }
        
        var body = Data()
        body.append("--\(boundary)\r\n".data(using: .utf8)!)
        body.append("Content-Disposition: form-data; name=\"image\"; filename=\"toni\"\r\n".data(using: .utf8)!)
        body.append("Content-Type: toni\r\n\r\n".data(using: .utf8)!)
        body.append(imageData)
        body.append("\r\n".data(using: .utf8)!)
        body.append("--\(boundary)--\r\n".data(using: .utf8)!)
        request.httpBody = body
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let parsedData = try JSONDecoder().decode(Pose.self, from: data)

        return parsedData
    })
}
