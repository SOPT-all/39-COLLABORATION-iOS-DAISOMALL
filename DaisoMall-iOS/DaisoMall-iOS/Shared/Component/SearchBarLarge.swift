//
//  SearchBarLarge.swift
//  DaisoMall-iOS
//
//  Created by BY on 11/10/26.
//

import SwiftUI

struct SearchBarLarge: View {
    @Binding var text: String
    @FocusState private var isFocused: Bool

    let onSearch: (String) -> Void

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 2)
                .fill(.grey1)

            HStack(spacing: 8) {
                SearchPlaceToggle()

                Rectangle()
                    .fill(.grey2)
                    .frame(width: 1, height: 16)

                HStack(spacing: 10) {
                    TextField(
                        "",
                        text: $text,
                        prompt: Text("상품, 품번, 브랜드 검색")
                            .foregroundStyle(.grey4)
                    )
                    .typography(.body_m_14)
                    .foregroundStyle(.grey10)
                    .frame(maxWidth: .infinity)
                    .focused($isFocused)
                    .onSubmit { submitSearch() }

                    Button {
                        submitSearch()
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
    
    private func submitSearch() {
        let keyword = text.trimmingCharacters(
            in: .whitespaces
        )
        
        guard !keyword.isEmpty else { return }

        isFocused = false
        onSearch(keyword)
    }
}

#Preview {
    SearchBarLarge(
        text: .constant(""), onSearch: { _ in }
    )
}
