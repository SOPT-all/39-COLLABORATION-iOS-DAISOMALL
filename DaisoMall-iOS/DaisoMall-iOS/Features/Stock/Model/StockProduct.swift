//
//  StockProduct.swift
//  DaisoMall-iOS
//
//  Created by 성환 on 11/12/26.
//

import Foundation

struct StockProduct {
    let id: Int
    let imageURL: URL?
    let name: String
    let price: String
    let productNumber: String
}

extension StockProduct {
    init(dto: StockProductDTO) {
        self.init(
            id: dto.productId,
            imageURL: URL(string: dto.imageUrl),
            name: dto.name,
            price: dto.price,
            productNumber: dto.productNumber
        )
    }
}
