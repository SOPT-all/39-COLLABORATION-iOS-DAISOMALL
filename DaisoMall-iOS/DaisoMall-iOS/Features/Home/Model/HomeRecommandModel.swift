//
//  HomeRecommandModel.swift
//  DaisoMall-iOS
//
//  Created by BY on 11/12/26.
//

import SwiftUI

struct HomeRecommendModel: Identifiable {
    let id: Int
    let image: URL?
    let price: String
    let name: String
    let reviewCount: String
    var isLiked: Bool
}

extension HomeRecommendModel {
    init(dto: RecommendProductDTO) {
        self.id = dto.productId
        self.image = URL(string: dto.imageUrl)
        self.price = dto.price
        self.name = dto.name
        self.reviewCount = dto.reviewCount
        self.isLiked = dto.liked
    }
}
