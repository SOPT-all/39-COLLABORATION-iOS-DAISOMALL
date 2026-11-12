//
//  Navigation.swift
//  DaisoMall-iOS
//
//  Created by BY on 11/10/26.
//

import SwiftUI

struct NavigationBar: View {
    @Binding var selectedTab: NavigationTab

    var body: some View {
        HStack(spacing: 0) {
            ForEach(NavigationTab.allCases, id: \.self) { tab in
                navigationItem(tab)

                if tab != NavigationTab.allCases.last {
                    Spacer()
                }
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .frame(height: 52)
        .background(.daisoWhite)
    }

    private func navigationItem(
        _ tab: NavigationTab
    ) -> some View {
        Button {
            selectedTab = tab
        } label: {
            VStack(spacing: 0) {
                tab.icon
                    .resizable()
                    .renderingMode(.template)
                    .foregroundStyle(.daisoBlack)
                    .frame(width: 24, height: 24)

                Text(tab.title)
                    .typography(
                        selectedTab == tab
                            ? .caption_b_10
                        : .caption_m_10
                    )
                    .foregroundStyle(.daisoBlack)
            }
            .frame(width: 40, height: 36)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    @Previewable @State var selectedTab: NavigationTab = .home

    NavigationBar(
        selectedTab: $selectedTab
    )
}
