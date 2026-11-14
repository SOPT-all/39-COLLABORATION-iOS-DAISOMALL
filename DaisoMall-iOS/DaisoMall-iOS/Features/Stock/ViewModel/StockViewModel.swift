//
//  StockViewModel.swift
//  DaisoMall-iOS
//
//  Created by 성환 on 11/12/26.
//

import Foundation
import Observation

@Observable
final class StockViewModel {
    private(set) var product = StockProduct.dummy
    private(set) var stores = StoreStock.dummyList
    private(set) var isSoldOutExcluded = true

    var displayedStores: [StoreStock] {
        isSoldOutExcluded ? stores.filter { $0.stockQuantity > 0 } : stores
    }

    func toggleSoldOutExcluded() {
        isSoldOutExcluded.toggle()
    }

    func toggleBookmark(id: Int) {
        guard let index = stores.firstIndex(where: { $0.id == id }) else { return }

        stores[index].isBookmarked.toggle()
    }
}
