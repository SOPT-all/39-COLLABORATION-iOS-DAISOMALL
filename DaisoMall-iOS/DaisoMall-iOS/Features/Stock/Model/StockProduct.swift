//
//  StockProduct.swift
//  DaisoMall-iOS
//
//  Created by 성환 on 11/12/26.
//

import SwiftUI

struct StockProduct {
    let id: Int
    let image: ImageResource
    let name: String
    let price: Int
    let productNumber: String
}

extension StockProduct {
    static let dummy = StockProduct(
        id: 1001,
        image: .imgProduct,
        name: "[화잘먹/80매]마미케어 바다포도 스킨팩",
        price: 5000,
        productNumber: "1075034"
    )
}
