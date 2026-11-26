//
//  HomeViewModel.swift
//  DaisoMall-iOS
//
//  Created by BY on 11/15/26.
//

import Foundation
import Observation

@Observable
final class HomeViewModel {
    private(set) var banners = MainBannerModel.dummyList
    private(set) var recommendItems: [HomeRecommendModel] = []
    
    func toggleLike(id: Int) async {
        guard let index = recommendItems.firstIndex(
            where: { $0.id == id }
        ) else {
            return
        }
        recommendItems[index].isLiked.toggle()
        
        do {
            let _ : ProductLikeResponseDTO = try await BaseService.shared.request(endPoint: .liked(id: id), body: ProductLikeRequestDTO(liked: recommendItems[index].isLiked))
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func fetchProducts(keyword: String?) async {
        do {
            let response: RecommendProductResponseDTO =
            try await BaseService.shared.request(
                endPoint: .list(keyword: keyword)
            )
            
            recommendItems = response.products.map { data in HomeRecommendModel(dto: data)}
        } catch {
            print(error.localizedDescription)
        }
    }
}
