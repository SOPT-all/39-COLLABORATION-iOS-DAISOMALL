//
//  HomeRecommand.swift
//  DaisoMall-iOS
//
//  Created by BY on 11/12/26.
//

import SwiftUI

struct HomeRecommand: View {
    let product: HomeRecommandModel
    @State private var isLiked = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 6) {
            ///이미지
            ZStack(alignment: .bottomTrailing) {
                if let image = product.image {
                    Image(image)
                        .resizable()
                        .frame(height: 144)
                        .frame(maxWidth: .infinity)
                } else {
                    Image(.imgRecommanditem0)
                        .resizable()
                        .frame(height: 144)
                        .frame(maxWidth: .infinity)
                }
                
                Button {
                    isLiked.toggle()
                } label: {
                    Image(
                        isLiked
                        ? .heartActive
                        : .heart
                    )
                    .resizable()
                    .frame(width: 20, height: 20)
                }
                .padding(7)
            }
            
            ///담기버튼
            ProductActionButton(title: "담기", icon: .icAvailablestores) {}
            
            ///상세정보 VStack
            VStack(alignment: .leading, spacing: 6) {
                HStack(spacing: 4) {
                    Text("\(product.price)원")
                        .typography(.body_b_14)
                        .foregroundStyle(.daisoBlack)
                    
                    NewTag()
                }
                ///제목
                Text(product.name)
                    .typography(.body_m_12)
                    .foregroundStyle(.daisoBlack)
                    .frame(maxWidth: .infinity, alignment: .leading)
                ///택배 태그
                HomeTag()
                ///별점
                HStack(spacing: 4) {
                    Image(product.rating)
                        .resizable()
                        .frame(width: 60, height: 12)
                    
                    Text("\(product.reviewCount)")
                        .typography(.caption_sb_10)
                        .foregroundStyle(.daisoBlack)
                }
            }
        }
        .frame(width: 109)
    }
}

#Preview {
    HomeRecommand(product: HomeRecommandModel.products[0])
}
