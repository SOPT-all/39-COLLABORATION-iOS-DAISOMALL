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
    case productStores(productID: Int, isSoldOutExcluded: Bool)
    case storeFavorite(storeID: Int)

    var path: String {
        switch self {
        case .example(let id):
            "/api/v1/examples/\(id)";
        case .list:
            "/api/v1/products";
        case .liked(let id):
            "/api/v1/products/\(id)/like";
        case .productStores(let productID, _):
            "/api/v1/products/\(productID)/stores"
        case .storeFavorite(let storeID):
            "/api/v1/stores/\(storeID)/favorite"
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
        case .productStores:
            .get
        case .storeFavorite:
            .patch
        }
    }

    var header: [String: String] {
        switch self {
        case .example, .list, .liked, .productStores, .storeFavorite:
            HeaderType.basic.value
        }
    }

    var queryItems: [URLQueryItem] {
        switch self {
        case .example, .liked, .storeFavorite:
            []
        case .list(let keyword):
            [
                URLQueryItem(
                    name: "keyword",
                    value: keyword
                )
            ]
        case .productStores(_, let isSoldOutExcluded):
            [URLQueryItem(name: "soldOut", value: String(isSoldOutExcluded))]
        }
    }
}
