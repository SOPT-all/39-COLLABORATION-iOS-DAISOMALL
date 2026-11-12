//
//  PurchaseOptionButton.swift
//  DaisoMall-iOS
//
//  Created by 성환 on 11/10/26.
//

import SwiftUI

struct PurchaseOptionButton: View {
    enum Style {
        case redLine
        case redFilled
        case blackLine
    }

    let title: String
    var icon: ImageResource? = nil
    let style: Style
    var isEnabled = true
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(alignment: .center, spacing: 0) {
                if let icon {
                    Image(icon)
                        .renderingMode(.template)
                        .foregroundStyle(iconColor)
                }

                Text(title)
                    .typography(.body_m_12)
                    .foregroundStyle(titleColor)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 4)
            .padding(borderWidth)
            .background(backgroundColor, in: RoundedRectangle(cornerRadius: 2))
            .overlay(
                RoundedRectangle(cornerRadius: 2)
                    .strokeBorder(borderColor, lineWidth: borderWidth)
            )
        }
        .buttonStyle(.plain)
        .disabled(!isEnabled)
    }

    private var titleColor: Color {
        guard isEnabled else { return .grey5 }

        switch style {
        case .redLine:
            return .primaryRed
        case .redFilled:
            return .daisoWhite
        case .blackLine:
            return .grey9
        }
    }

    private var iconColor: Color {
        if isEnabled && style == .blackLine {
            return .grey10
        }
        return titleColor
    }

    private var backgroundColor: Color {
        guard isEnabled else { return .grey2 }

        switch style {
        case .redLine, .blackLine:
            return .daisoWhite
        case .redFilled:
            return .primaryRed
        }
    }

    private var borderColor: Color {
        switch style {
        case .redLine, .redFilled:
            return .primaryRed
        case .blackLine:
            return .grey10
        }
    }

    private var borderWidth: CGFloat {
        guard isEnabled else { return 0 }

        switch style {
        case .redLine, .blackLine:
            return 1
        case .redFilled:
            return 0
        }
    }
}

#Preview {
    VStack(alignment: .leading, spacing: 12) {
        PurchaseOptionButton(title: "온라인 구매", icon: .icShoppingbagSmall, style: .redLine) {}
        PurchaseOptionButton(title: "매장픽업", icon: .icShoppingbagSmall, style: .redFilled) {}
        PurchaseOptionButton(
            title: "픽업미운영",
            icon: .icShoppingbagSmall,
            style: .redFilled,
            isEnabled: false
        ) {}
        PurchaseOptionButton(title: "재입고알림", icon: .bell20, style: .blackLine) {}
    }
    .padding()
}
