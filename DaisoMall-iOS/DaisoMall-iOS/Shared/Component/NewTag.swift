//
//  NewTag.swift
//  DaisoMall-iOS
//
//  Created by BY on 11/10/26.
//

import SwiftUI

struct NewTag: View {
    private let borderWidth: CGFloat = 1
    
    var body: some View {
        Text("NEW")
            .typography(.caption_sb_10)
            .padding(borderWidth)
            .padding(.horizontal, 2)
            .foregroundStyle(.daisoBlack)
            .border(.daisoBlack, width: borderWidth)
    }
}

#Preview {
    NewTag()
}
