//
//  GradientTextField.swift
//  sign-up-screen-sample
//
//  Created by Philipp Lazarev on 27.10.2024.
//

import Foundation
import UIKit



import UIKit

final class GradientTextField: UITextField {
    private let gradientLayer = CAGradientLayer()
    private let borderLayer = CAShapeLayer()
    private let borderWidth: CGFloat = 2

    required init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        clipsToBounds = true
        self.textColor = .white
        self.textAlignment = .center
        layer.cornerRadius = 3.71
        setupGradientBorder()
    }
    
    private func setupGradientBorder() {
        gradientLayer.colors = StyleGuide.shared.CGGradientColors
        gradientLayer.startPoint = CGPoint(x: 0, y: 1)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        gradientLayer.frame = bounds
        gradientLayer.cornerRadius = layer.cornerRadius
        
        let maskPath = UIBezierPath(roundedRect: bounds.insetBy(dx: borderWidth / 2, dy: borderWidth / 2),
                                    cornerRadius: layer.cornerRadius)
        borderLayer.path = maskPath.cgPath
        borderLayer.lineWidth = borderWidth
        borderLayer.fillColor = UIColor.clear.cgColor
        borderLayer.strokeColor = UIColor.black.cgColor
        gradientLayer.mask = borderLayer
        
        layer.addSublayer(gradientLayer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
        borderLayer.path = UIBezierPath(roundedRect: bounds.insetBy(dx: borderWidth / 2, dy: borderWidth / 2),
                                        cornerRadius: layer.cornerRadius).cgPath
    }
}
