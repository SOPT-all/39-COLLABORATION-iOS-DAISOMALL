//
//  HomeTag.swift
//  DaisoMall-iOS
//
//  Created by BY on 11/10/26.
//

import SwiftUI

struct HomeTag: View {
    var body: some View {
        Text("택배")
            .typography(.caption_b_10)
            .foregroundStyle(.grey8)
            .padding(.horizontal, 6)
            .padding(.vertical, 4)
            .background(.grey1)
    }
}

#Preview {
    HomeTag()
}
