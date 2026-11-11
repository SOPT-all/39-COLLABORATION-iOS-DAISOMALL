//
//  SearchBarLarge.swift
//  DaisoMall-iOS
//
//  Created by BY on 11/10/26.
//

import SwiftUI

struct SearchBarLarge: View {
    @Binding var text: String

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 2)
                .fill(Color(.grey1))

            HStack(spacing: 8) {
                Toggle()

                Rectangle()
                    .fill(Color(.grey2))
                    .frame(width: 1, height: 16)

                HStack(spacing: 10) {
                    TextField(
                        "",
                        text: $text,
                        prompt: Text("매장, 지역 검색")
                            .foregroundStyle(Color(.grey4))
                    )
                    .typography(.body_m_14)
                    .foregroundStyle(Color(.grey10))
                    .frame(maxWidth: .infinity)

                    Button {
                        // 추후에 동작 추가 예정
                    } label: {
                        Image(.icSearch)
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 8)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 46)
    }
}

#Preview {
    SearchBarLarge(
            text: .constant("")
    )
}
