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
    private(set) var recommendItems = HomeRecommendModel.products
    
    //인덱스 찾는 함수
    func toggleLike(id: UUID) {
        guard let index = recommendItems.firstIndex(
            where: { $0.id == id }
        ) else {
            return
        }
        
        recommendItems[index].isLiked.toggle()
    }
}
