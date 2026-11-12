//
//  TextChip.swift
//  DaisoMall-iOS
//
//  Created by 성환 on 11/10/26.
//

import SwiftUI

struct TextChip: View {
    let title: String
    var icon: ImageResource? = nil
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(alignment: .center, spacing: 0) {
                if !isSelected, let icon {
                    Image(icon)
                }

                Text(title)
                    .typography(.body_m_12)
                    .foregroundStyle(titleColor)

                if isSelected {
                    Image(.icClose)
                        .renderingMode(.template)
                        .foregroundStyle(.daisoWhite)
                }
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .padding(borderWidth)
            .frame(maxHeight: .infinity)
            .background(backgroundColor, in: Capsule())
            .overlay(Capsule().strokeBorder(.grey1, lineWidth: borderWidth))
        }
        .buttonStyle(.plain)
    }

    private var titleColor: Color {
        isSelected ? .daisoWhite : .grey10
    }

    private var backgroundColor: Color {
        isSelected ? .grey9 : .daisoWhite
    }

    private var borderWidth: CGFloat {
        isSelected ? 0 : 1
    }
}

#Preview {
    HStack(alignment: .center, spacing: 8) {
        TextChip(title: "텍스트", icon: .icRun, isSelected: false) {}
        TextChip(title: "텍스트", isSelected: false) {}
        TextChip(title: "텍스트", icon: .icRun, isSelected: true) {}
    }
    .frame(height: 34)
    .padding()
}
