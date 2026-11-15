//
//  NetworkLogger.swift
//  DaisoMall-iOS
//
//  Created by 성환 on 11/15/26.
//

import Foundation

enum NetworkLogger {
    static func requestLog(request: URLRequest) {
        var lines = [
            "\n🛰️ Request 🛰️",
            "URL: \(request.url?.absoluteString ?? "없음")",
            "Method: \(request.httpMethod ?? "없음")"
        ]

        request.allHTTPHeaderFields?.forEach { lines.append("\($0.key): \($0.value)") }

        if let body = request.httpBody,
           let bodyString = String(data: body, encoding: .utf8) {
            lines.append("Body: \(bodyString)")
        }

        print(lines.joined(separator: "\n"))
    }

    static func responseLog(response: HTTPURLResponse, data: Data) {
        let lines = [
            "\n⛑️ Response ⛑️",
            "URL: \(response.url?.absoluteString ?? "없음")",
            "StatusCode: \(response.statusCode)",
            "Body: \(String(data: data, encoding: .utf8) ?? "")"
        ]

        print(lines.joined(separator: "\n"))
    }
}
