//
//  StoreStockCard.swift
//  DaisoMall-iOS
//
//  Created by 성환 on 11/12/26.
//

import SwiftUI

struct StoreStockCard: View {
    let store: StoreStock
    let onBookmarkTapped: () -> Void

    var body: some View {
        HStack(alignment: .top, spacing: 6) {
            StoreCardImage(image: store.image, businessStatus: store.businessStatus)

            VStack(alignment: .leading, spacing: 0) {
                storeInfo

                Spacer(minLength: 0)

                actionButton
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(height: 110)
    }

    private var storeInfo: some View {
        VStack(alignment: .leading, spacing: 6) {
            VStack(alignment: .leading, spacing: 4) {
                HStack(alignment: .bottom, spacing: 0) {
                    HStack(alignment: .center, spacing: 4) {
                        Text(store.name)
                            .typography(.body_b_16)
                            .foregroundStyle(.grey10)

                        Text(store.distance)
                            .typography(.caption_r_10)
                            .foregroundStyle(.grey6)
                    }

                    Spacer(minLength: 0)

                    Button(action: onBookmarkTapped) {
                        Image(store.isBookmarked ? ImageResource.icBookmarkPress : .icBookmark)
                    }
                    .buttonStyle(.plain)
                }

                Text(stockText)
                    .typography(.body_sb_12)
                    .foregroundStyle(stockTextColor)
            }

            if store.stockStatus != .soldOut {
                LocationTag(floor: "2F", zone: "2번")
            }
        }
    }

    @ViewBuilder
    private var actionButton: some View {
        switch store.stockStatus {
        case .pickupAvailable:
            PurchaseOptionButton(title: "매장픽업", icon: .icShoppingbagSmall, style: .redFilled) {}
        case .pickupUnavailable:
            PurchaseOptionButton(
                title: "픽업미운영",
                icon: .icShoppingbagSmall,
                style: .redFilled,
                isEnabled: false
            ) {}
        case .soldOut:
            PurchaseOptionButton(title: "재입고알림", icon: .bell20, style: .blackLine) {}
        }
    }

    private var stockText: String {
        switch store.stockStatus {
        case .pickupAvailable, .pickupUnavailable:
            return "재고 \(store.stockQuantity)개 이하"
        case .soldOut:
            return "일시품절"
        }
    }

    private var stockTextColor: Color {
        store.stockStatus == .soldOut ? .grey6 : .primaryRed
    }
}

#Preview {
    VStack(spacing: 20) {
        ForEach(StoreStock.dummyList) { store in
            StoreStockCard(store: store) {}
        }
    }
    .padding(.horizontal, 20)
}
