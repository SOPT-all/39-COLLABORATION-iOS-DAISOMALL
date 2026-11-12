//
//  CategoryTabBar.swift
//  DaisoMall-iOS
//
//  Created by BY on 11/12/26.
//

import SwiftUI

struct CategoryTabBar: View {
    let category: Category

    @Binding var selectedCategory: Category
    
    private var isSelected: Bool {
        selectedCategory == category
    }

    var body: some View {
        Button {
            selectedCategory = category
        } label: {
            Text(category.title)
                .typography(.body_m_14)
                .foregroundStyle(
                    isSelected
                        ? .daisoWhite
                        : .daisoBlack
                )
                .padding(.horizontal, 10)
                .padding(.vertical, 8)
                .background(
                    isSelected
                        ? .daisoBlack
                        : .daisoWhite,
                    in: RoundedRectangle(cornerRadius: 18)
                )
        }
        .buttonStyle(.plain)
    }
    
    enum Category: CaseIterable, Hashable {
        case home
        case beautyAndHealth
        case fashion
        case newItem
        case membership

        var title: String {
            switch self {
            case .home:
                "홈"
            case .beautyAndHealth:
                "뷰티&헬스"
            case .fashion:
                "패션"
            case .newItem:
                "신상"
            case .membership:
                "멤버십"
            }
        }
    }
}

#Preview {
    @Previewable @State var selectedCategory:
        CategoryTabBar.Category = .home

    HStack(spacing: 0) {
        ForEach(
            CategoryTabBar.Category.allCases,
            id: \.self
        ) { category in
            CategoryTabBar(
                category: category,
                selectedCategory: $selectedCategory
            )
        }
    }
}
