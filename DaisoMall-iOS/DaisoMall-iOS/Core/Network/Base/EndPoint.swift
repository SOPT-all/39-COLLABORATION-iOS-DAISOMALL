//
//  EndPoint.swift
//  DaisoMall-iOS
//
//  Created by 성환 on 11/15/26.
//

import Foundation

enum EndPoint {
    case example(id: Int)
    case productStores(productID: Int, isSoldOutExcluded: Bool)

    var path: String {
        switch self {
        case .example(let id):
            "/api/v1/examples/\(id)"
        case .productStores(let productID, _):
            "/api/v1/products/\(productID)/stores"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .example, .productStores:
            .get
        }
    }

    var header: [String: String] {
        switch self {
        case .example, .productStores:
            HeaderType.basic.value
        }
    }

    var queryItems: [URLQueryItem] {
        switch self {
        case .example:
            []
        case .productStores(_, let isSoldOutExcluded):
            [URLQueryItem(name: "soldOut", value: String(isSoldOutExcluded))]
        }
    }
}
