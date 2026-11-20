//
//  StoreCardImage.swift
//  DaisoMall-iOS
//
//  Created by 성환 on 11/12/26.
//

import Kingfisher
import SwiftUI

struct StoreCardImage: View {
    let imageURL: URL?
    let businessStatus: StoreStock.BusinessStatus

    var body: some View {
        KFImage(imageURL)
            .placeholder {
                Image(.imgPlaceholder)
                    .resizable()
                    .scaledToFill()
            }
            .resizable()
            .scaledToFill()
            .frame(width: 82, height: 110)
            .clipped()
            .overlay(alignment: .bottom) {
                statusBar
            }
    }

    private var statusBar: some View {
        HStack(alignment: .center, spacing: 3) {
            Circle()
                .fill(statusColor)
                .overlay(
                    Circle()
                        .strokeBorder(.daisoWhite, lineWidth: 1)
                )
                .frame(width: 6, height: 6)

            Text(statusText)
                .typography(.caption_b_10)
                .foregroundStyle(.daisoWhite)
        }
        .padding(.vertical, 2)
        .frame(maxWidth: .infinity)
        .background(.grey8)
    }

    private var statusText: String {
        switch businessStatus {
        case .open:
            return "영업중"
        case .closed:
            return "영업종료"
        }
    }

    private var statusColor: Color {
        switch businessStatus {
        case .open:
            return .primaryRed
        case .closed:
            return .grey5
        }
    }
}

#Preview {
    HStack(alignment: .top, spacing: 12) {
        StoreCardImage(imageURL: nil, businessStatus: .open)
        StoreCardImage(imageURL: nil, businessStatus: .closed)
    }
    .padding()
}
