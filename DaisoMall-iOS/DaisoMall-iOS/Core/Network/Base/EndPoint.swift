//
//  EndPoint.swift
//  DaisoMall-iOS
//
//  Created by 성환 on 11/15/26.
//

import Foundation

enum EndPoint {
    case example(id: Int)
    case list(keyword: String?)
    case liked(id: Int)

    var path: String {
        switch self {
        case .example(let id):
            "/api/v1/examples/\(id)";
        case .list:
            "/api/v1/products";
        case .liked(let id):
            "/api/v1/products/\(id)/like";
        }
    }

    var method: HTTPMethod {
        switch self {
        case .example:
                .get
        case .list:
                .get
        case .liked:
                .patch
        }
    }

    var header: [String: String] {
        switch self {
        case .example, .list, .liked:
            HeaderType.basic.value
        }
    }

    var queryItems: [URLQueryItem] {
        switch self {
        case .example, .liked:
            []
        case .list(let keyword):
            [
                URLQueryItem(
                    name: "keyword",
                    value: keyword
                )
            ]
        }
    }
}
