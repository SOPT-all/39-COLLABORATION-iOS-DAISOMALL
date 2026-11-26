//
//  RecommendProductDTO.swift
//  DaisoMall-iOS
//
//  Created by BY on 11/26/26.
//

import Foundation

struct RecommendProductResponseDTO: Decodable {
    let products: [RecommendProductDTO]
}

struct RecommendProductDTO: Decodable {
    let productId: Int
    let name: String
    let price: String
    let imageUrl: String
    let reviewCount: String
    var liked: Bool
}
