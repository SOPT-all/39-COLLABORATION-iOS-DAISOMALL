//
//  ProductListViewModel.swift
//  DaisoMall-iOS
//
//  Created by BY on 11/15/26.
//

import Foundation
import Observation

@Observable
final class ProductListViewModel {
    private(set) var products: [ProductCardModel] = []
    
    func toggleLike(id: Int) {
        guard let index = products.firstIndex(
            where: { $0.id == id }
        ) else {
            return
        }
        
        products[index].isLiked.toggle()
    }
    
    func fetchProducts(keyword: String?) async {
        do {
            let response: ProductListResponseDTO =
            try await BaseService.shared.request(
                endPoint: .list(keyword: keyword)
            )
            
            products = response.products.map { data in ProductCardModel(dto: data)}
        } catch {
            print(error.localizedDescription)
        }
    }
}
