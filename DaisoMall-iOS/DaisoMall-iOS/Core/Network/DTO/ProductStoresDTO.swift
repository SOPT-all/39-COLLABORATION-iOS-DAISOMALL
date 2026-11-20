//
//  ProductStoresDTO.swift
//  DaisoMall-iOS
//
//  Created by 성환 on 11/18/26.
//

import Foundation

struct ProductStoresDTO: Decodable {
    let product: StockProductDTO
    let stores: [StoreStockDTO]
}

struct StockProductDTO: Decodable {
    let productId: Int
    let productNumber: String
    let name: String
    let price: String
    let imageUrl: String
}

struct StoreStockDTO: Decodable {
    let storeId: Int
    let storeName: String
    let imageUrl: String
    let businessStatus: String
    let bookmarked: Bool
    let distance: String
    let stockQuantity: Int
    let pickupAvailable: Bool
}
