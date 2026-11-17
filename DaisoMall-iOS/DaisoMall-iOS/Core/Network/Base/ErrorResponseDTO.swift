//
//  ErrorResponseDTO.swift
//  DaisoMall-iOS
//
//  Created by 성환 on 11/15/26.
//

import Foundation

struct ErrorResponseDTO: Decodable {
    let code: String
    let message: String
}
