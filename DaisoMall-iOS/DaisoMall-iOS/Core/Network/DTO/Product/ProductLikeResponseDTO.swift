//
//  ProductLikeResponseDTO.swift
//  DaisoMall-iOS
//
//  Created by BY on 11/18/26.
//

import SwiftUI

struct ProductLikeResponseDTO: Decodable {
    let productId: Int
    var liked: Bool    
}
