//
//  SearchBar.swift
//  DaisoMall-iOS
//
//  Created by BY on 11/10/26.
//

import SwiftUI

struct SearchBarSmall: View {
    @Binding var text: String

    var body: some View {
            HStack(spacing: 10) {
                TextField(
                    "",
                    text: $text,
                    prompt: Text("매장, 지역 검색")
                        .foregroundStyle(.grey4)
                )
                .typography(.body_m_14)
                .foregroundStyle(.grey10)
                .frame(maxWidth: .infinity)

                Image(.icSearch)
                    .resizable()
                    .frame(width: 20, height: 20)
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 10)
            .frame(maxWidth: .infinity)
            .frame(height: 40)
            .background(
                .daisoWhite,
                in: RoundedRectangle(cornerRadius: 2)
            )
            .overlay {
                RoundedRectangle(cornerRadius: 2)
                    .strokeBorder(
                        .grey3,
                        lineWidth: 1
                    )
            }
        }
}

#Preview {
    @Previewable @State var searchText = ""

    SearchBarSmall(
        text: $searchText
    )
}
