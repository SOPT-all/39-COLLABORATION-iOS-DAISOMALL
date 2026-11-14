//
//  BannerPageTag.swift
//  DaisoMall-iOS
//
//  Created by BY on 11/10/26.
//

import SwiftUI

struct BannerPageTag: View {
    let currentPage: Int
    let totalPage: Int
    
    var body: some View {
        HStack(alignment: .center, spacing: 3) {
            Text("\(currentPage)")
            Text("/")
            Text("\(totalPage)")
        }
        .typography(.caption_r_10)
        .foregroundStyle(.daisoWhite)
        .frame(width: 30, height: 12)
        .padding(4)
        .background(
            Color.daisoBlack.opacity(0.2),
            in: RoundedRectangle(cornerRadius: 10)
        )
    }
}

#Preview {
    BannerPageTag(currentPage: 1, totalPage: 13)
}
