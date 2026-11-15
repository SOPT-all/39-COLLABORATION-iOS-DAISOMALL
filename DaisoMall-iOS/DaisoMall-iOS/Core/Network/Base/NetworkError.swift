//
//  NetworkError.swift
//  DaisoMall-iOS
//
//  Created by 성환 on 11/15/26.
//

import Foundation

enum NetworkError: LocalizedError {
    case invalidURL
    case invalidResponse
    case requestEncodingFailed
    case responseDecodingFailed
    case noData
    case invalidStatusCode(Int)
    case serverError(code: String, message: String)

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            "사용할 수 없는 URL입니다."
        case .invalidResponse:
            "올바르지 않은 응답입니다."
        case .requestEncodingFailed:
            "요청 데이터를 만들지 못했습니다."
        case .responseDecodingFailed:
            "응답 데이터를 읽지 못했습니다."
        case .noData:
            "응답에 데이터가 없습니다."
        case .invalidStatusCode(let statusCode):
            "서버 오류가 발생했습니다. (\(statusCode))"
        case .serverError(_, let message):
            message
        }
    }
}
