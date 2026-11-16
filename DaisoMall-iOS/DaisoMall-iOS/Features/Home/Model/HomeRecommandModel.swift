//
//  HomeRecommandModel.swift
//  DaisoMall-iOS
//
//  Created by BY on 11/12/26.
//

import SwiftUI

struct HomeRecommendModel: Identifiable {
    let id = UUID()
    let image: ImageResource?
    let price: Int
    let isNew: Bool
    let name: String
    let rating: ImageResource
    let reviewCount: Int
    var isLiked: Bool
}

extension HomeRecommendModel {
    static  let products: [HomeRecommendModel] = [
        HomeRecommendModel(
            image: .imgRecommanditem1,
            price: 5000,
            isNew: true,
            name: "[화잘먹/80매]마미케어 바다포도 스킨팩",
            rating: .icStar,
            reviewCount: 70,
            isLiked: false
        ),
        HomeRecommendModel(
            image: .imgRecommanditem2,
            price: 5000,
            isNew: false,
            name: "[01라이트]본셉 비타씨에센스비비 30ml",
            rating: .icStar,
            reviewCount: 70,
            isLiked: false
        ),
        HomeRecommendModel(
            image: .imgRecommanditem3,
            price: 5000,
            isNew: true,
            name: "오오티디 랩 하트 스팟패치 24매입",
            rating: .icStar,
            reviewCount: 70,
            isLiked: false
        ),
        HomeRecommendModel(
            image: .imgRecommanditem4,
            price: 5000,
            isNew: true,
            name: "후시덤 흔적 리페어 캡슐 크림 60 g",
            rating: .icStar,
            reviewCount: 70,
            isLiked: false
        )
    ]
}
