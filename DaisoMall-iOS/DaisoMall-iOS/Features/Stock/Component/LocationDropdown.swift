//
//  LocationDropdown.swift
//  DaisoMall-iOS
//
//  Created by 성환 on 11/12/26.
//

import SwiftUI

struct LocationDropdown: View {
    let distance: Int

    var body: some View {
        HStack(alignment: .center, spacing: 3) {
            Image(.icLocation)

            Text("\(distance)km")
                .typography(.body_m_14)
                .foregroundStyle(.grey6)

            Image(.icChevronDownLocation)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(.daisoWhite, in: RoundedRectangle(cornerRadius: 2))
        .overlay(
            RoundedRectangle(cornerRadius: 2)
                .strokeBorder(.grey3, lineWidth: 1)
        )
    }
}

#Preview {
    VStack(alignment: .leading, spacing: 12) {
        LocationDropdown(distance: 5)
    }
    .padding()
}
