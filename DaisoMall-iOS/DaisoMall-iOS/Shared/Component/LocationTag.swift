//
//  LocationTag.swift
//  DaisoMall-iOS
//
//  Created by 성환 on 11/10/26.
//

import SwiftUI

struct LocationTag: View {
    let floor: String
    let zone: String

    private let borderWidth: CGFloat = 1

    var body: some View {
        HStack(alignment: .center, spacing: 4) {
            Text(floor)
                .typography(.caption_b_10)
            
            Rectangle()
                .fill(.grey3)
                .frame(width: 1, height: 10)
            
            Text(zone)
                .typography(.caption_b_10)
        }
        .foregroundStyle(.grey7)
        .padding(.horizontal, 4)
        .padding(.vertical, 2)
        .padding(borderWidth)
        .background(.daisoWhite)
        .border(.grey3, width: borderWidth)
    }
}

#Preview {
    LocationTag(floor: "2F", zone: "2번")
}
