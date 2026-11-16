//
//  HomeRecommand.swift
//  DaisoMall-iOS
//
//  Created by BY on 11/12/26.
//

import SwiftUI

struct HomeRecommend: View {
    var product: HomeRecommendModel
    let onLikeTap: () -> Void
    
    var body: some View {
        VStack(alignment: .center, spacing: 6) {
            ZStack(alignment: .bottomTrailing) {
                Image(product.image ?? .imgRecommanditem0)
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
                    
                    if product.isNew { NewTag() }
                }
                
                Text(product.name)
                    .typography(.body_m_12)
                    .foregroundStyle(.daisoBlack)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HomeTag()

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
    @Previewable @State var product =
        HomeRecommendModel.products[0]

    HomeRecommend(product: product, onLikeTap: {})
}
