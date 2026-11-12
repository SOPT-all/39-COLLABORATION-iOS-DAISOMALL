//
//  StockView.swift
//  DaisoMall-iOS
//
//  Created by 성환 on 11/12/26.
//

import SwiftUI

struct StockView: View {
    @State private var vm = StockViewModel()
    @State private var searchText = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            topBar

            StockProductCard(product: vm.product)
                .padding(.horizontal, 20)
                .padding(.top, 20)

            StoreTabGroup()
                .padding(.top, 20)

            searchSection
                .padding(.top, 16)

            filterSection
                .padding(.top, 12)

            stockNotice
                .padding(.top, 10)

            ScrollView {
                storeList
            }
            .scrollIndicators(.hidden)
            .padding(.top, 10)
        }
        .background(.daisoWhite)
    }

    private var topBar: some View {
        HStack(alignment: .center, spacing: 10) {
            Button {
            } label: {
                Image(.icArrowLeft)
            }
            .buttonStyle(.plain)

            Text("매장재고 조회")
                .typography(.title_b_18)
                .foregroundStyle(.grey10)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private var searchSection: some View {
        HStack(alignment: .center, spacing: 8) {
            LocationDropdown(distance: 5)

            SearchBarSmall(text: $searchText)
        }
        .padding(.horizontal, 20)
    }

    private var filterSection: some View {
        HStack(alignment: .center, spacing: 8) {
            Image(.icFilter)
                .padding(6)
                .padding(1)
                .background(.daisoWhite, in: Circle())
                .overlay(
                    Circle()
                        .strokeBorder(.grey2, lineWidth: 1)
                )

            Rectangle()
                .fill(.grey4)
                .frame(width: 1, height: 15)

            TextChip(title: "품절제외", isSelected: vm.isSoldOutExcluded) {
                vm.toggleSoldOutExcluded()
            }

            TextChip(title: "매장픽업", icon: .icRun, isSelected: false) {}

            TextChip(title: "영업중", icon: .icClock, isSelected: false) {}
        }
        .frame(height: 34)
        .padding(.horizontal, 20)
    }

    private var stockNotice: some View {
        HStack(alignment: .center, spacing: 5) {
            Image(.icInfo)

            Text("실제 매장 재고와 다를 수 있습니다.")
                .typography(.body_r_12)
                .foregroundStyle(.grey5)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
    }

    private var storeList: some View {
        LazyVStack(alignment: .leading, spacing: 20) {
            ForEach(vm.displayedStores) { store in
                StoreStockCard(store: store) {
                    vm.toggleBookmark(id: store.id)
                }
            }
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    StockView()
}
