//
//  Typography.swift
//  DaisoMall-iOS
//
//  Created by BY on 11/9/26.
//

import SwiftUI

enum Typography {
    case titleB24
    case titleB18
    case bodyB16
    case bodyM16
    case bodyM14
    case bodyB14
    case bodyR14
    case bodySB12
    case bodyM12
    case bodyR12
    case bodyM11
    case captionSB10
    case captionR10
    case captionB10
    case captionM10
    case captionB8

    var size: CGFloat {
        switch self {
        case .titleB24: 24
        case .titleB18: 18
        case .bodyB16: 16
        case .bodyM16: 16
        case .bodyM14: 14
        case .bodyB14: 14
        case .bodyR14: 14
        case .bodySB12: 12
        case .bodyM12: 12
        case .bodyR12: 12
        case .bodyM11: 11
        case .captionSB10: 10
        case .captionR10: 10
        case .captionB10: 10
        case .captionM10: 10
        case .captionB8: 8
        }
    }

    var weight: Font.Weight {
        switch self {
        case .titleB24: .bold
        case .titleB18: .bold
        case .bodyB16: .bold
        case .bodyM16: .medium
        case .bodyM14: .medium
        case .bodyB14: .bold
        case .bodyR14: .regular
        case .bodySB12: .semibold
        case .bodyM12: .medium
        case .bodyR12: .regular
        case .bodyM11: .medium
        case .captionSB10: .semibold
        case .captionR10: .regular
        case .captionB10: .bold
        case .captionM10: .medium
        case .captionB8: .bold
        }
    }

    var lineHeightPercent: CGFloat {
        switch self {
        case .titleB24: 120
        case .titleB18: 120
        case .bodyB16: 120
        case .bodyM16: 120
        case .bodyM14: 120
        case .bodyB14: 120
        case .bodyR14: 120
        case .bodySB12: 120
        case .bodyM12: 120
        case .bodyR12: 120
        case .bodyM11: 120
        case .captionSB10: 120
        case .captionR10: 120
        case .captionB10: 120
        case .captionM10: 120
        case .captionB8: 120
        }
    }

    var letterSpacingPercent: CGFloat {
        switch self {
        case .titleB24: -4
        case .titleB18: -1
        case .bodyB16: -2
        case .bodyM16: -4
        case .bodyM14: -2
        case .bodyB14: 0
        case .bodyR14: -1
        case .bodySB12: -2
        case .bodyM12: -2
        case .bodyR12: -4
        case .bodyM11: 2
        case .captionSB10: -4
        case .captionR10: -4
        case .captionB10: -1
        case .captionM10: -1
        case .captionB8: 0
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
