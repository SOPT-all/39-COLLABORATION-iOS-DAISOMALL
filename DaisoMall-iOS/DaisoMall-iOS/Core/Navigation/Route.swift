//
//  Route.swift
//  DaisoMall-iOS
//
//  Created by 성환 on 11/16/26.
//

import Foundation

enum Route: Hashable {
    case stock(productID: Int)
    case list(keyword: String)
}
