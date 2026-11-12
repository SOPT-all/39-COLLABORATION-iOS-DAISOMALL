//
//  NavigationTab.swift
//  DaisoMall-iOS
//
//  Created by BY on 11/11/26.
//

import SwiftUI

enum NavigationTab: CaseIterable, Hashable {
    case home
    case category
    case stock
    case discover
    case my

    var title: String {
        switch self {
        case .home:
            return "홈"
        case .category:
            return "카테고리"
        case .stock:
            return "재고조회"
        case .discover:
            return "발견"
        case .my:
            return "마이"
        }
    }

    var icon: Image {
        switch self {
        case .home:
            return Image(.icHome)
        case .category:
            return Image(.icCategory)
        case .stock:
            return Image(.icStock)
        case .discover:
            return Image(.icPlay)
        case .my:
            return Image(.icMypage)
        }
    }
}
