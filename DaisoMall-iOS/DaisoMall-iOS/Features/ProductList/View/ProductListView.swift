//
//  ProductListView.swift
//  DaisoMall-iOS
//
//  Created by BY on 11/15/26.
//

import SwiftUI

struct ProductListView: View {
    @State var searchText: String
    @State private var vm = ProductListViewModel()
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                searchBarSection
                    .padding(.bottom, 10)
                
                categoryBar
                    .padding(.bottom, 20)
                
                optionBar
            }
            
            ScrollView(.vertical, showsIndicators: false) {
                productList
                    .padding(.top, 20)
            }
        }
    }
    
    private var searchBarSection: some View {
        HStack(spacing: 0) {
            Button {
                //
            } label: {
                Image(.icArrowLeft)
                    .resizable()
                    .frame(width: 24, height: 24)
                    .padding(10)
            }
            SearchBarLarge(text: $searchText)
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 20)
    }
    
    private var categoryBar: some View {
        HStack(spacing: 8) {
            Image(.icFilter)
                .resizable()
                .frame(width: 20, height: 20)
                .padding(6)
                .background(.daisoWhite)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(.grey2, lineWidth: 1)
                )
            
            Rectangle()
                .fill(.grey4)
                .frame(width: 1, height: 15)
            
            Dropdown(title: "NEW", style: .outlined, showsChevron: false)
            Dropdown(title: "브랜드", style: .filled)
            Dropdown(title: "카테고리", style: .filled)
            Dropdown(title: "별점", style: .filled)
        }
        .padding(.leading, 20)
    }
    
    private var optionBar: some View {
        HStack(spacing: 0) {
            Image(.icCheckBox)
                .padding(.trailing, 6)
            
            Text("품절제외")
                .typography(.body_r_14)
                .foregroundStyle(.grey6)
            
            Spacer()
            
            Dropdown(title: "추천순", style: .outlined)
        }
        .padding(.vertical, 4)
        .padding(.horizontal, 20)
        .overlay(alignment: .top) {
            Rectangle()
                .fill(.grey1)
                .frame(height: 1)
        }
        .overlay(alignment: .bottom) {
            Rectangle()
                .fill(.grey1)
                .frame(height: 1)
        }
    }
    
    private var productList: some View {
        LazyVStack(alignment: .center, spacing: 20) {
            ForEach(vm.products) { product in
                ProductCard(product: product) {
                    vm.toggleLike(id: product.id)
                }
                if product.id != vm.products.last?.id {
                    Rectangle()
                        .fill(.grey1)
                        .frame(height: 1)
                }
            }
        }
    }
}

#Preview {
    ProductListView(searchText: "")
}
