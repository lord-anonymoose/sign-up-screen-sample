//
//  StyleGuide.swift
//  sign-up-screen-sample
//
//  Created by Philipp Lazarev on 26.10.2024.
//

import Foundation
import UIKit



final class StyleGuide {
    static let shared = StyleGuide()

    private init() {
        
    }
    
    let backgroundColor = UIColor(hex: "#090615") ?? .systemBackground
    let secondaryBackgroundColor = UIColor(hex: "#181528") ?? .secondarySystemBackground
    let lightBlue = UIColor(hex: "#4CA2FF") ?? .systemBlue
    
    let CGGradientColors: [CGColor] = [
        UIColor(hex: "#9358F7")?.cgColor ?? UIColor.white.cgColor,
        UIColor(hex: "#7B78F2")?.cgColor ?? UIColor.white.cgColor,
        UIColor(hex: "#6197EE")?.cgColor ?? UIColor.white.cgColor,
        UIColor(hex: "#45B5E9")?.cgColor ?? UIColor.white.cgColor,
        UIColor(hex: "#10D7E2")?.cgColor ?? UIColor.white.cgColor,
    ]
    
    let UIGradientColors: [UIColor] = [
        UIColor(hex: "#9358F7") ?? UIColor.white,
        UIColor(hex: "#7B78F2") ?? UIColor.white,
        UIColor(hex: "#6197EE") ?? UIColor.white,
        UIColor(hex: "#45B5E9") ?? UIColor.white,
        UIColor(hex: "#10D7E2") ?? UIColor.white,
    ]

}
