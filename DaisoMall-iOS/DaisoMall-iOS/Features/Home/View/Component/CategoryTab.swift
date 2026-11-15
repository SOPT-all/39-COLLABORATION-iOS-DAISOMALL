//
//  CategoryTab.swift
//  DaisoMall-iOS
//
//  Created by BY on 11/12/26.
//

import SwiftUI

struct CategoryTab: View {
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
                .foregroundStyle(isSelected ? .daisoWhite : .daisoBlack)
                .padding(.horizontal, 10)
                .padding(.vertical, 8)
                .background(
                    isSelected ? .daisoBlack : .daisoWhite,
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
                return "홈"
            case .beautyAndHealth:
                return "뷰티&헬스"
            case .fashion:
                return "패션"
            case .newItem:
                return "신상"
            case .membership:
                return "멤버십"
            }
        }
    }
}

#Preview {
    @Previewable @State var selectedCategory:
        CategoryTab.Category = .home

    HStack(spacing: 0) {
        ForEach( CategoryTab.Category.allCases, id: \.self) { category in
            CategoryTab(
                category: category,
                selectedCategory: $selectedCategory
            )
        }
    }
}
