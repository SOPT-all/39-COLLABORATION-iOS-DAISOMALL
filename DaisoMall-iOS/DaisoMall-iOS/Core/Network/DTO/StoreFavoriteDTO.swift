//
//  StoreFavoriteDTO.swift
//  DaisoMall-iOS
//
//  Created by 성환 on 11/19/26.
//

import Foundation

struct StoreFavoriteRequestDTO: Encodable {
    let favorite: Bool
}

struct StoreFavoriteResponseDTO: Decodable {
    let storeId: Int
    let favorite: Bool
}
