//
//  GradientButton.swift
//  sign-up-screen-sample
//
//  Created by Philipp Lazarev on 26.10.2024.
//

import Foundation
import UIKit



final class GradientButton: UIButton {
    private let gradientLayer = CAGradientLayer()

    required init() {
        super.init(frame: .zero)
        self.isUserInteractionEnabled = true
        self.translatesAutoresizingMaskIntoConstraints = false
        setupUI()
        setupGradient()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        //self.layer.cornerRadius = 41
        self.layer.cornerRadius = 28
        self.clipsToBounds = true
    }
    
    private func setupGradient() {
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [
            UIColor(hex: "#9358F7")?.cgColor ?? UIColor.white.cgColor,
            UIColor(hex: "#7B78F2")?.cgColor ?? UIColor.white.cgColor,
            UIColor(hex: "#6197EE")?.cgColor ?? UIColor.white.cgColor,
            UIColor(hex: "#45B5E9")?.cgColor ?? UIColor.white.cgColor,
            UIColor(hex: "#10D7E2")?.cgColor ?? UIColor.white.cgColor,
        ]
        
        gradientLayer.startPoint = CGPoint(x: 0, y: 1)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = self.bounds
    }
}