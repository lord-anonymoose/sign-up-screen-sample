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
    let lightBlue = UIColor(hex: "#4CA2FF") ?? .systemBlue

}
