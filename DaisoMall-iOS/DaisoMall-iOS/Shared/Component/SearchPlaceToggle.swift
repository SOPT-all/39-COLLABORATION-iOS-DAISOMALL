//
//  SearchPlaceToggle.swift
//  DaisoMall-iOS
//
//  Created by BY on 11/10/26.
//

import SwiftUI

struct SearchPlaceToggle: View {
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 10)
                .fill(.daisoWhite)
            
            HStack(spacing: 0) {
                Text("매장")
                    .typography(.body_sb_12)
                    .foregroundStyle(.daisoWhite)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(
                        .grey10,
                        in: RoundedRectangle(cornerRadius: 10)
                    )
                
                Text("온라인")
                    .typography(.body_sb_12)
                    .foregroundStyle(.grey9)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .frame(width: 84, height: 30)
    }
}

#Preview {
    SearchPlaceToggle()
}
