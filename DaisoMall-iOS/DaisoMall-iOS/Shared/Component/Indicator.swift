//
//  Indicator.swift
//  DaisoMall-iOS
//
//  Created by BY on 11/10/26.
//

import SwiftUI

enum IndicatorState {
    case first
    case right
}

struct Indicator: View {
    let state: IndicatorState

    var body: some View {
        HStack(spacing: 2) {
            Rectangle()
                .fill(
                    state == .first
                        ? Color(.grey10)
                        : Color(.grey5)
                )
                .frame(width: 9, height: 2)

            Rectangle()
                .fill(
                    state == .right
                        ? Color(.grey10)
                        : Color(.grey5)
                )
                .frame(width: 9, height: 2)
        }
    }
}

#Preview {
    Indicator(state: .right)
}
