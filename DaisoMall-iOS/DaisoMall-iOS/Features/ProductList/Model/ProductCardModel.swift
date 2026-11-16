//
//  ProductCardModel.swift
//  DaisoMall-iOS
//
//  Created by BY on 11/15/26.
//

import SwiftUI

struct ProductCardModel: Identifiable {
    let id = UUID()
    let image: ImageResource
    let price: Int
    let name: String
    let productNumber: String
    let stars: ImageResource
    let reviewCounts: String
    var isLiked: Bool
}

extension ProductCardModel {
    static let dummyList: [ProductCardModel] = [
        ProductCardModel(
            image: .imgCosmetic1,
            price: 1000,
            name: "[생기충전]VT PDRN 톤온 젤리 시트 마스크 1매입",
            productNumber: "1075034",
            stars: .star5,
            reviewCounts: "9,999+",
            isLiked: false
        ),
        ProductCardModel(
            image: .imgCosmetic2,
            price: 1000,
            name: "[탄력케어]마미케어 콜라겐 마스크 1매입",
            productNumber: "1075034",
            stars: .star5,
            reviewCounts: "50",
            isLiked: false
        )
    ]
}
