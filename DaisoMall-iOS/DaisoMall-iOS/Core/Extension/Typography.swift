//
//  Typography.swift
//  DaisoMall-iOS
//
//  Created by BY on 11/9/26.
//

import SwiftUI

enum Typography {
    case title_b_24
    case title_b_18
    case body_b_16
    case body_m_16
    case body_m_14
    case body_b_14
    case body_r_14
    case body_sb_12
    case body_m_12
    case body_r_12
    case body_m_11
    case caption_sb_10
    case caption_r_10
    case caption_b_10
    case caption_m_10
    case caption_b_8
    
    
    var size: CGFloat {
        switch self {
        case .title_b_24: 24
        case .title_b_18: 18
        case .body_b_16: 16
        case .body_m_16: 16
        case .body_m_14: 14
        case .body_b_14: 14
        case .body_r_14: 14
        case .body_sb_12: 12
        case .body_m_12: 12
        case .body_r_12: 12
        case .body_m_11: 11
        case .caption_sb_10: 10
        case .caption_r_10: 10
        case .caption_b_10: 10
        case .caption_m_10: 10
        case .caption_b_8: 8
        }
    }
    
    var weight: Font.Weight {
        switch self {
        case .title_b_24: .bold
        case .title_b_18: .bold
        case .body_b_16: .bold
        case .body_m_16: .medium
        case .body_m_14: .medium
        case .body_b_14: .bold
        case .body_r_14: .regular
        case .body_sb_12: .semibold
        case .body_m_12: .medium
        case .body_r_12: .regular
        case .body_m_11: .medium
        case .caption_sb_10: .semibold
        case .caption_r_10: .regular
        case .caption_b_10: .bold
        case .caption_m_10: .medium
        case .caption_b_8: .bold
        }
    }
    
    var lineHeightPercent: CGFloat {
        120
    }
    
    var letterSpacingPercent: CGFloat {
        switch self {
        case .title_b_24: -4
        case .title_b_18: -1
        case .body_b_16: -2
        case .body_m_16: -4
        case .body_m_14: -2
        case .body_b_14: 0
        case .body_r_14: -1
        case .body_sb_12: -2
        case .body_m_12: -2
        case .body_r_12: -4
        case .body_m_11: 2
        case .caption_sb_10: -4
        case .caption_r_10: -4
        case .caption_b_10: -1
        case .caption_m_10: -1
        case .caption_b_8: 0
        }
    }

    var lineHeight: CGFloat {
        size * lineHeightPercent / 100
    }

    var letterSpacing: CGFloat {
        size * letterSpacingPercent / 100
    }
}

private struct TypographyModifier: ViewModifier { ///수정자 설정
    let style: Typography

    func body(content: Content) -> some View {
        let extraSpacing = style.lineHeight - Pretendard.uiFont(size: style.size, weight: style.weight).lineHeight
        content
            .font(.pretendard(size: style.size, weight: style.weight))
            .tracking(style.letterSpacing)
            .lineSpacing(extraSpacing)
            .padding(.vertical, extraSpacing / 2)
    }
}

extension View {
    func typography(_ style: Typography) -> some View {
        modifier(TypographyModifier(style: style))
    }
}
