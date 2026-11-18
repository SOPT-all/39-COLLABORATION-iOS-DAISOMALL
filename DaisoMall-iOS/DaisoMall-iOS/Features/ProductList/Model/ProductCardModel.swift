//
//  ProductCardModel.swift
//  DaisoMall-iOS
//
//  Created by BY on 11/15/26.
//

import SwiftUI

struct ProductCardModel: Identifiable {
    let id: Int
    let image: URL?
    let price: String
    let name: String
    let productNumber: String
    let reviewCounts: String
    var isLiked: Bool
}

extension ProductCardModel {
    init(dto: ProductDTO) {
        self.id = dto.productId
        self.image = URL(string: dto.imageUrl)
        self.price = dto.price
        self.name = dto.name
        self.productNumber = dto.productNumber
        self.reviewCounts = dto.reviewCount
        self.isLiked = dto.liked
    }
}

