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
    private(set) var products = ProductCardModel.dummyList
    
    func toggleLike(id: UUID) {
            guard let index = products.firstIndex(
                where: { $0.id == id }
            ) else {
                return
            }
            
            products[index].isLiked.toggle()
        }
}
