//
//  QuickMenu.swift
//  DaisoMall-iOS
//
//  Created by BY on 11/12/26.
//

import SwiftUI

struct QuickMenu: View {
    let style: Style
    let onTap: (Style) -> Void
    
    var body: some View {
        Button {
            onTap(style)
        } label: {
            VStack(alignment: .center, spacing: 8) {
                Image(style.image)
                    .resizable()
                    .frame(width: 50, height: 50)

                Text(style.title)
                    .typography(.caption_m_10)
                    .foregroundStyle(Color(.daisoBlack))
            }
        }
        .buttonStyle(.plain)
    }
    
    enum Style: CaseIterable, Hashable {
        case hotItem
        case ranking
        case promotion
        case newItem
        case todayDelivery
        
        var title: String {
            switch self {
            case .hotItem:
            return "다이소핫템"
            case .ranking:
                return "랭킹"
            case .promotion:
                return "기획전"
            case .newItem:
                return "신상"
            case .todayDelivery:
                return "오늘배송"
            }
        }
        
        var image: ImageResource {
            switch self {
            case .hotItem:
                return .imgQuickbanner1
            case .ranking:
                return .imgQuickbanner2
            case .promotion:
                return .imgQuickbanner3
            case .newItem:
                return .imgQuickbanner4
            case .todayDelivery:
                return .imgQuickbanner5
            }
        }
        
    }
}



#Preview {
    QuickMenu(
        style: .hotItem,
        onTap: { _ in})
}
