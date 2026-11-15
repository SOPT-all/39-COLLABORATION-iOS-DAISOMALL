//
//  EndPoint.swift
//  DaisoMall-iOS
//
//  Created by 성환 on 11/15/26.
//

import Foundation

enum EndPoint {
    case example(id: Int)

    var path: String {
        switch self {
        case .example(let id):
            "/api/v1/examples/\(id)"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .example:
            .get
        }
    }

    var header: [String: String] {
        switch self {
        case .example:
            HeaderType.basic.value
        }
    }

    var queryItems: [URLQueryItem] {
        switch self {
        case .example:
            []
        }
    }
}
