//
//  ProductActionButton.swift
//  DaisoMall-iOS
//
//  Created by 성환 on 11/10/26.
//

import SwiftUI

struct ProductActionButton: View {
    let title: String
    var icon: ImageResource? = nil
    let action: () -> Void

    private let borderWidth: CGFloat = 1

    var body: some View {
        Button(action: action) {
            HStack(alignment: .center, spacing: 0) {
                if let icon {
                    Image(icon)
                }

                Text(title)
                    .typography(.body_sb_12)
                    .foregroundStyle(.grey9)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 4)
            .padding(borderWidth)
            .background(.daisoWhite, in: RoundedRectangle(cornerRadius: 2))
            .overlay(
                RoundedRectangle(cornerRadius: 2)
                    .strokeBorder(.grey2, lineWidth: borderWidth)
            )
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    HStack(alignment: .center, spacing: 11) {
        ProductActionButton(title: "담기", icon: .icAvailablestores) {}
        ProductActionButton(title: "구매가능 매장찾기", icon: .icAvailablestores) {}
    }
    .padding()
}
