//
//  StockProductCard.swift
//  DaisoMall-iOS
//
//  Created by 성환 on 11/12/26.
//

import SwiftUI

struct StockProductCard: View {
    let product: StockProduct

    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Image(product.image)
                .resizable()
                .scaledToFill()
                .frame(width: 82, height: 111)
                .clipped()

            VStack(alignment: .leading, spacing: 0) {
                productInfo

                Spacer(minLength: 0)

                PurchaseOptionButton(
                    title: "온라인 구매",
                    icon: .icShoppingbagSmall,
                    style: .redLine
                ) {}
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(height: 111)
        .padding(10)
        .overlay(
            Rectangle()
                .strokeBorder(.grey1, lineWidth: 1)
        )
    }

    private var productInfo: some View {
        VStack(alignment: .leading, spacing: 4) {
            VStack(alignment: .leading, spacing: 4) {
                HStack(alignment: .center, spacing: 0) {
                    Text(product.price.formatted())
                        .typography(.body_b_14)

                    Text("원")
                        .typography(.body_sb_12)
                }

                Text(product.name)
                    .typography(.body_m_12)
            }
            .foregroundStyle(.grey10)

            HStack(alignment: .center, spacing: 2) {
                Text("품번")
                Text(product.productNumber)
            }
            .typography(.caption_m_10)
            .foregroundStyle(.grey5)
        }
    }
}

#Preview {
    StockProductCard(product: .dummy)
        .padding(.horizontal, 20)
}
