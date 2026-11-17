//
//  HomeView.swift
//  DaisoMall-iOS
//
//  Created by BY on 11/12/26.
//

import SwiftUI

struct HomeView: View {
    @State private var vm = HomeViewModel()
    @State private var searchText = ""
    @State private var selectedCategory: CategoryTab.Category = .home
    
    let onSearch: (String) -> Void
    
    var body: some View {
        VStack(alignment: .center) {
            homeHeader
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(.daisoWhite)

            
            ScrollView(.vertical, showsIndicators: false) {
                bannerSection
                
                recommendSection
                .padding(.leading, 20)
            }
        }
    }
    
    private var homeHeader: some View {
        VStack(alignment: .center, spacing: 0) {
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
            HStack(spacing: 0) {
                ForEach(CategoryTab.Category.allCases,id: \.self
                ) { category in
                    CategoryTab(
                        category: category,
                        selectedCategory: $selectedCategory
                    )
                }
                Spacer()
            }
            .padding(.vertical, 8)
            SearchBarLarge( text: $searchText, onSearch: onSearch )
        }
    }
    
    private var bannerSection: some View {
        LazyVStack(alignment: .center, spacing: 20) {
            HStack(spacing: 4) {
                ForEach(vm.banners, id: \.self) { banner in
                    MainBanner(
                        banner: banner,
                        currentPage: 1,
                        totalPage: 13)
                }
            }
            Group {
                HStack(spacing: 0) {
                    ForEach(QuickMenu.Style.allCases,id: \.self) { style in
                        QuickMenu(style: style)
                        
                        if style != QuickMenu.Style.allCases.last {
                            Spacer()
                        }
                    }
                }
                Image(.imgStripbanner)
                    .resizable()
                    .frame(height: 80)
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, 20)
            }
            .padding(.horizontal, 20)
        }
    }
    
    private var recommendSection: some View {
        LazyVStack(alignment: .leading, spacing: 16) {
            Text("고객님을 위한 오늘 추천상품")
                .typography(.title_b_18)
                .foregroundStyle(.daisoBlack)
            HStack(alignment: .top, spacing:4) {
                ForEach(vm.recommendItems) { product in
                    HomeRecommend(
                        product: product,
                        onLikeTap: {
                        vm.toggleLike(id: product.id)
                        })
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .clipped()
        }
    }
}

#Preview {
    HomeView { keyword in
        print("검색어:", keyword)
    }
}
