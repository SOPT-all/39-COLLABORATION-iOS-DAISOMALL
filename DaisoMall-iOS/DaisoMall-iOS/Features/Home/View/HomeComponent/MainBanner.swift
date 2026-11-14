//
//  MainBanner.swift
//  DaisoMall-iOS
//
//  Created by BY on 11/12/26.
//

import SwiftUI

struct MainBanner: View {
    let banner: MainBannerModel
    let currentPage: Int
    let totalPage: Int
    
    var body: some View {
        ZStack(alignment: .bottom) {
            if let image = banner.image {
                Image(image)
                    .resizable()
                    .scaledToFill()
            } else {
                Image(.imgBigbanner0)
                    .resizable()
                    .scaledToFill()
            }

            HStack(alignment: .bottom, spacing: 8) {
                VStack(alignment: .leading, spacing: 8) {
                    Text(banner.title)
                        .typography(.title_b_24)
                        
                    Text(banner.description)
                        .typography(.body_m_16)
                }
                .foregroundStyle(.daisoWhite)
                .frame(maxWidth: .infinity, alignment: .leading) ///정렬 안할 시, .center로 정렬됨
                
                /// 페이지 태그
                BannerPageTag(currentPage: currentPage, totalPage: totalPage)
            }
            .padding(20)
        }
        .frame(width: 334, height: 334)
        .clipped()
    }
}

#Preview {
    MainBanner(banner: MainBannerModel.banners[0], currentPage: 1, totalPage: 13)
}
