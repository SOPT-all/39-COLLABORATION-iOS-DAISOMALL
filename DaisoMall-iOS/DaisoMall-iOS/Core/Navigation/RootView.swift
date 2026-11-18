//
//  RootView.swift
//  DaisoMall-iOS
//
//  Created by 성환 on 11/16/26.
//

import SwiftUI

struct RootView: View {
    @State private var path: [Route] = []
    @State private var selectedTab: NavigationTab = .home

    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            NavigationStack(path: $path) {
                tabContent
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .toolbar(.hidden, for: .navigationBar)
                    .navigationDestination(for: Route.self) { route in
                        destination(route)
                    }
            }

            NavigationBar(selectedTab: $selectedTab)
        }
        .onChange(of: selectedTab) {
            path.removeAll()
        }
    }

    @ViewBuilder
    private var tabContent: some View {
        switch selectedTab {
        case .home:
            HomeView { keyword in
                path.append(
                    .list(keyword: keyword)
                )
            }
        case .category:
            Text("카테고리")
        case .stock:
            ProductListView (
                searchText: "",
                onBack: {
                    selectedTab = .home
                },
                onSearch: { _ in }
            )
        case .discover:
            Text("발견")
        case .my:
            Text("마이")
        }
    }

    @ViewBuilder
    private func destination(_ route: Route) -> some View {
        switch route {
        case .stock(let productID):
            StockView(productID: productID)
        case .list(let keyword):
            ProductListView(
                searchText: keyword,
                onBack: {
                    path.removeLast()
                },
                onSearch: { newSearchText in
                    path = [
                        .list(keyword: newSearchText)
                    ]
                }
            )
        }
    }
}

#Preview {
    RootView()
}
