//
//  ProductCard.swift
//  DaisoMall-iOS
//
//  Created by BY on 11/15/26.
//

import SwiftUI
import Kingfisher

struct ProductCard: View {
    let product: ProductCardModel
    let onLikeTap: () -> Void
    
    var body: some View {
        HStack(spacing: 14) {
            ZStack(alignment: .bottomTrailing) {
                KFImage(product.image)
                    .resizable()
                    .frame(width: 112, height: 148)
                
                Button {
                    onLikeTap()
                } label: {
                    Image(product.isLiked ? .heartActive : .heart)
                    .resizable()
                    .frame(width: 20, height: 20)
                }
                .padding(7)
            }
            
            productInfo
        }
        .frame(height: 148)
    }
    
    private var productInfo: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading, spacing: 2) {
                HStack(spacing: 4) {
                    HStack(spacing: 0) {
                        Text(product.price)
                            .typography(.title_b_18)
                        Text("원")
                            .typography(.body_b_16)
                    }
                    .foregroundStyle(.grey10)
                    
                    NewTag()
                }
                
                Text("\(product.name)")
                    .typography(.body_sb_12)
                    .foregroundStyle(.grey10)
                    .lineLimit(2)
                
                HStack(spacing: 2) {
                    Text("품번")
                    Text(product.productNumber)
                }
                .typography(.caption_m_10)
                .foregroundStyle(.grey5)
            }
            .padding(.bottom, 7)
            
            HStack(spacing: 6) {
                Image(.star5)
                
                Text(product.reviewCounts)
                    .typography(.caption_r_10)
                    .foregroundStyle(.grey10)
            }
            
            Spacer()
            
            ProductActionButton(title: "구매가능 매장찾기", icon: .icAvailablestores) {}
        }
    }
}

#Preview {
    ProductCard(
        product: ProductCardModel(
            id: 1,
            image: nil,
            price: "1,000",
            name: "[생기충전]VT PDRN 톤온 젤리 시트 마스크 1매입",
            productNumber: "1075034",
            reviewCounts: "9,999+",
            isLiked: false
        ),
           onLikeTap: {}
       )
}
