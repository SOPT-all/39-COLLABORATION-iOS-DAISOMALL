//
//  MainBannerModel.swift
//  DaisoMall-iOS
//
//  Created by BY on 11/12/26.
//

import SwiftUI

struct MainBannerModel: Identifiable {
    let id = UUID()
    let image: ImageResource?
    let title: String
    let description: String
}

extension MainBannerModel {
    static let banners: [MainBannerModel] = [
        MainBannerModel(
            image: .imgBigbanner1,
            title: "10월 4주차\n다이소 신상",
            description: "이번주 핫한 신상품을 소개합니다"
        ),
        MainBannerModel(
            image: .imgBigbanner2,
            title: "",
            description: ""
        ),
        MainBannerModel(
            image: .imgBigbanner3,
            title: "",
            description: ""
        )
    ]
}

