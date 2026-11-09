//
//  Font+.swift
//  DaisoMall-iOS
//
//  Created by BY on 11/8/26.
//

import SwiftUI
import UIKit

enum Pretendard {
    static func fontName(for weight: Font.Weight) -> String {
        let weightMap: [(Font.Weight, String)] = [
            (.bold, "Bold"),
            (.medium, "Medium"),
            (.regular, "Regular"),
            (.semibold, "SemiBold")
        ]
        let weightString = weightMap.first { $0.0 == weight }?.1 ?? "Regular"
        return "Pretendard-\(weightString)"
    }
    
    static func uiFont(size: CGFloat, weight: Font.Weight) -> UIFont {
        UIFont(name: fontName(for: weight), size: size) ?? .systemFont(ofSize: size)
    }
}

extension Font {
    static func pretendard(size fontSize: CGFloat, weight: Font.Weight) -> Font {
        return Font.custom(Pretendard.fontName(for: weight), size: fontSize)
    }
}
