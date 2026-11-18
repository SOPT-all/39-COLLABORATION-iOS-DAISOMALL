//
//  StoreStock.swift
//  DaisoMall-iOS
//
//  Created by 성환 on 11/12/26.
//

import Foundation

struct StoreStock: Identifiable {
    enum BusinessStatus: String {
        case open = "OPEN"
        case closed = "CLOSED"
    }

    enum StockStatus {
        case pickupAvailable
        case pickupUnavailable
        case soldOut
    }

    let id: Int
    let name: String
    let imageURL: URL?
    let businessStatus: BusinessStatus
    var isBookmarked: Bool
    let distance: String
    let stockQuantity: Int
    let isPickupAvailable: Bool

    var stockStatus: StockStatus {
        guard stockQuantity > 0 else { return .soldOut }

        return isPickupAvailable ? .pickupAvailable : .pickupUnavailable
    }
}

extension StoreStock {
    init(dto: StoreStockDTO) {
        self.init(
            id: dto.storeId,
            name: dto.storeName,
            imageURL: URL(string: dto.imageUrl),
            businessStatus: BusinessStatus(rawValue: dto.businessStatus) ?? .closed,
            isBookmarked: dto.bookmarked,
            distance: dto.distance,
            stockQuantity: dto.stockQuantity,
            isPickupAvailable: dto.pickupAvailable
        )
    }
}
