//
//  Toggle.swift
//  DaisoMall-iOS
//
//  Created by BY on 11/10/26.
//

import SwiftUI

struct Toggle: View {
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.daisoWhite)
            
            HStack(spacing: 0) {
                Text("매장")
                    .typography(.body_sb_12)
                    .foregroundStyle(Color(.daisoWhite))
                    .frame(width: 42, height: 30)
                    .background(
                        Color.grey10,
                        in: RoundedRectangle(cornerRadius: 10)
                    )
                
                Text("온라인")
                    .typography(.body_sb_12)
                    .foregroundStyle(Color(.grey9))
                    .frame(width: 42, height: 30)
            }
        }
        .frame(width: 84, height: 30)
    }
}

#Preview {
    Toggle()
}
