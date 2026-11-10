//
//  Dropdown.swift
//  DaisoMall-iOS
//
//  Created by 성환 on 11/10/26.
//

import SwiftUI

struct Dropdown: View {
    enum Style {
        case filled
        case outlined
    }

    let title: String
    let style: Style
    var showsChevron = true

    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            Text(title)
                .typography(.body_r_14)
                .foregroundStyle(titleColor)

            if showsChevron {
                Image(.icChevronDown)
            }
        }
        .padding(.horizontal, 10)
        .padding(.horizontal, borderWidth)
        .frame(height: 32)
        .background(backgroundColor, in: RoundedRectangle(cornerRadius: 16))
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .strokeBorder(.grey1, lineWidth: borderWidth)
        )
    }

    private var titleColor: Color {
        switch style {
        case .filled:
            return .daisoBlack
        case .outlined:
            return .grey10
        }
    }

    private var backgroundColor: Color {
        switch style {
        case .filled:
            return .grey1
        case .outlined:
            return .clear
        }
    }

    private var borderWidth: CGFloat {
        switch style {
        case .filled:
            return 0
        case .outlined:
            return 1
        }
    }
}

#Preview {
    VStack(alignment: .leading, spacing: 12) {
        Dropdown(title: "NEW", style: .filled)
        Dropdown(title: "NEW", style: .outlined, showsChevron: false)
        Dropdown(title: "인기순", style: .outlined)
        Dropdown(title: "인기순", style: .filled, showsChevron: false)
    }
    .padding()
}
