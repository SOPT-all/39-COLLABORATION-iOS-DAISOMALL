//
//  HomeView.swift
//  DaisoMall-iOS
//
//  Created by BY on 11/12/26.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedCategory: CategoryTabBar.Category = .home
    @State private var text = ""
    let bannerOrder = [1, 0, 2]
    @State private var products = HomeRecommandModel.products
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack(alignment: .center, spacing: 0) {
                ///로고 알림
                HStack(spacing: 8) {
                    Image(.daisoLogo)
                        .resizable()
                        .frame(width: 86, height: 21)
                    
                    Spacer()
                    
                    Group {
                        Image(.bellAlarm24)
                        Image(.icShoppingbagBig)
                    }
                    .frame(width: 24, height: 24)
                }
                ///카테고리
                HStack(spacing: 0) {
                    ForEach(
                        CategoryTabBar.Category.allCases,
                        id: \.self
                    ) { category in
                        CategoryTabBar(
                            category: category,
                            selectedCategory: $selectedCategory
                        )
                    }
                    Spacer()
                }
                .padding(.vertical, 8)
                ///검색 바
                SearchBarLarge(text: $text)
            }
            .padding(.horizontal, 20)
        }
        .padding(.vertical, 10)
        .background(.daisoWhite)
        
        ///스크롤 뷰
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(alignment: .center, spacing: 20) {
                ///메인 배너
                HStack(spacing: 4) {
                    ForEach(bannerOrder, id: \.self) { index in
                        MainBanner(
                         banner: MainBannerModel.banners[index],
                         currentPage: 1,
                         totalPage: 13
                        )
                    }
                }

                Group {
                    ///빠른 메뉴
                    HStack(spacing: 0) {
                        ForEach(
                            QuickMenu.Style.allCases,
                            id: \.self
                        ) { style in
                            QuickMenu(style: style) {_ in}
                            
                            if style != QuickMenu.Style.allCases.last {
                                Spacer()
                            }
                        }
                    }
                    ///광고 이미지
                    Image(.imgStripbanner)
                        .resizable()
                        .frame(height: 80)
                        .frame(maxWidth: .infinity)
                        .padding(.bottom, 20)
                }
                .padding(.horizontal, 20)
            }
            
            LazyVStack(alignment: .leading, spacing: 16) {
                ///제목
                Text("고객님을 위한 오늘 추천상품")
                    .typography(.title_b_18)
                    .foregroundStyle(.daisoBlack)
                HStack(alignment: .top, spacing:4) {
                    ForEach($products) { $product in
                        HomeRecommand(
                            product: $product
                        )
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .clipped()
            }
            .padding(.leading, 20)
        }

    }
}

#Preview {
    HomeView()
}
