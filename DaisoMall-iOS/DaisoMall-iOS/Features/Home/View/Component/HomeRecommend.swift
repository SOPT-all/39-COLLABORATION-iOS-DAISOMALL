//
//  HomeRecommand.swift
//  DaisoMall-iOS
//
//  Created by BY on 11/12/26.
//

import SwiftUI
import Kingfisher

struct HomeRecommend: View {
    var product: HomeRecommendModel
    let onLikeTap: () -> Void
    
    var body: some View {
        VStack(alignment: .center, spacing: 6) {
            ZStack(alignment: .bottomTrailing) {
                KFImage(product.image)
                    .placeholder {
                        Image(.imgRecommanditem0)
                            .resizable()
                    }
                    .resizable()
                    .frame(height: 144)
                    .frame(maxWidth: .infinity)
                
                Button {
                    onLikeTap()
                } label: {
                    Image(product.isLiked ? .heartActive : .heart)
                    .resizable()
                    .frame(width: 20, height: 20)
                }
                .padding(7)
            }
            
            ProductActionButton(title: "담기", icon: .icAvailablestores) {}
            
            VStack(alignment: .leading, spacing: 6) {
                HStack(spacing: 4) {
                    Text("\(product.price)원")
                        .typography(.body_b_14)
                        .foregroundStyle(.daisoBlack)
                    
                    NewTag()
                }
                
                Text(product.name)
                    .typography(.body_m_12)
                    .foregroundStyle(.daisoBlack)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .lineLimit(2)
                
                HomeTag()

                HStack(spacing: 4) {
                    Image(.star5)
                    
                    Text(product.reviewCount)
                        .typography(.caption_sb_10)
                        .foregroundStyle(.daisoBlack)
                }
            }
        }
        .frame(width: 109)
    }
}

#Preview {
    let products: [HomeRecommendModel] = [
        HomeRecommendModel(
            id: 1,
            image: nil,
            price: "5,000",
            name: "[화잘먹/80매]마미케어 바다포도 스킨팩",
            reviewCount: "70",
            isLiked: false
        ),
        HomeRecommendModel(
            id: 2,
            image: nil,
            price: "5,000",
            name: "[01라이트]본셉 비타씨에센스비비 30ml",
            reviewCount: "70",
            isLiked: false
        ),
        HomeRecommendModel(
            id: 3,
            image: nil,
            price: "5,000",
            name: "오오티디 랩 하트 스팟패치 24매입",
            reviewCount: "70",
            isLiked: false
        ),
        HomeRecommendModel(
            id: 4,
            image: nil,
            price: "5,000",
            name: "후시덤 흔적 리페어 캡슐 크림 60 g",
            reviewCount: "70",
            isLiked: false
        )
    ]
    
    HStack(spacing: 5) {
        ForEach(products) { product in
            HomeRecommend(product: product, onLikeTap: {})
        }
    }
}
