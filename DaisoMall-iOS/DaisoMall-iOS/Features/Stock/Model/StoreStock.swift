//
//  StoreStock.swift
//  DaisoMall-iOS
//
//  Created by 성환 on 11/12/26.
//

import SwiftUI

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
    let image: ImageResource
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
    static let dummyList: [StoreStock] = [
        StoreStock(
            id: 201,
            name: "구로디지털단지역점",
            image: .imgMarket1,
            businessStatus: .open,
            isBookmarked: true,
            distance: "300m",
            stockQuantity: 56,
            isPickupAvailable: true
        ),
        StoreStock(
            id: 202,
            name: "구로디지털단지역점",
            image: .imgMarket2,
            businessStatus: .open,
            isBookmarked: false,
            distance: "300m",
            stockQuantity: 56,
            isPickupAvailable: true
        ),
        StoreStock(
            id: 203,
            name: "구로디지털단지역점",
            image: .imgMarket3,
            businessStatus: .closed,
            isBookmarked: false,
            distance: "1.5km",
            stockQuantity: 56,
            isPickupAvailable: false
        ),
        StoreStock(
            id: 204,
            name: "구로디지털단지역점",
            image: .imgMarket2,
            businessStatus: .open,
            isBookmarked: false,
            distance: "300m",
            stockQuantity: 0,
            isPickupAvailable: true
        )
    ]
}
