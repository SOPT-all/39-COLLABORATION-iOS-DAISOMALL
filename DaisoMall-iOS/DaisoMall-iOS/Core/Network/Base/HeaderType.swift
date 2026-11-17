//
//  HeaderType.swift
//  DaisoMall-iOS
//
//  Created by 성환 on 11/15/26.
//

enum HeaderType {
    case basic

    var value: [String: String] {
        switch self {
        case .basic:
            ["Content-Type": "application/json"]
        }
    }
}
