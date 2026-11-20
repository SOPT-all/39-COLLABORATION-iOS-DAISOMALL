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
    private(set) var product: StockProduct?
    private(set) var stores: [StoreStock] = []
    private(set) var isSoldOutExcluded = true

    func fetchStores(productID: Int) async {
        do {
            let response: ProductStoresDTO = try await BaseService.shared.request(
                endPoint: .productStores(productID: productID, isSoldOutExcluded: isSoldOutExcluded)
            )
            try Task.checkCancellation()
            product = StockProduct(dto: response.product)
            stores = response.stores.map { StoreStock(dto: $0) }
        } catch {
            print(error.localizedDescription)
        }
    }

    func toggleSoldOutExcluded() {
        isSoldOutExcluded.toggle()
    }

    func toggleBookmark(id: Int) {
        guard let index = stores.firstIndex(where: { $0.id == id }) else { return }

        stores[index].isBookmarked.toggle()
    }
}
