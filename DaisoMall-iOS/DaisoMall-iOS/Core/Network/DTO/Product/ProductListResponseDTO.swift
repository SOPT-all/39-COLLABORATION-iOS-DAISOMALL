//
//  ProductListResponseDTO.swift
//  DaisoMall-iOS
//
//  Created by BY on 11/18/26.
//

import Foundation

struct ProductListResponseDTO: Decodable {
    let products: [ProductDTO]
}

struct ProductDTO: Decodable {
    let productId: Int
    let productNumber: String
    let name: String
    let price: String
    let imageUrl: String
    let reviewCount: String
    var liked: Bool
}
