//
//  StoreTabGroup.swift
//  DaisoMall-iOS
//
//  Created by 성환 on 11/12/26.
//

import SwiftUI

struct StoreTabGroup: View {
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            tabItem(title: "매장 검색", isSelected: true)

            tabItem(title: "관심 매장", isSelected: false)
        }
        .frame(height: 46)
    }

    private func tabItem(title: String, isSelected: Bool) -> some View {
        HStack(alignment: .center, spacing: 6) {
            Text(title)
                .typography(isSelected ? .body_b_14 : .body_m_14)
                .foregroundStyle(isSelected ? Color.grey10 : Color.grey6)

            if isSelected {
                countBadge
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.daisoWhite)
        .overlay(alignment: .bottom) {
            Rectangle()
                .fill(isSelected ? Color.grey10 : Color.grey1)
                .frame(height: isSelected ? 2 : 1)
        }
    }

    private var countBadge: some View {
        Text("48")
            .typography(.caption_b_10)
            .foregroundStyle(.daisoWhite)
            .padding(.horizontal, 4)
            .frame(minWidth: 20, minHeight: 20)
            .background(.grey10, in: Capsule())
    }
}

#Preview {
    StoreTabGroup()
}
