//
//  GradientTextField.swift
//  sign-up-screen-sample
//
//  Created by Philipp Lazarev on 27.10.2024.
//

import UIKit



final class GradientTextField: UITextField {
    private let gradientLayer = CAGradientLayer()
    private let borderLayer = CAShapeLayer()
    private let borderWidth: CGFloat = 0.93

    required init() {
        super.init(frame: .zero)
        setupUI()
        setupGradientBorder()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
        setupGradientBorder()
    }
    
    private func setupUI() {
        clipsToBounds = true
        self.textColor = .white
        self.textAlignment = .center
        layer.cornerRadius = 3.71
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupGradientBorder() {
        gradientLayer.colors = StyleGuide.shared.CGGradientColors
        gradientLayer.startPoint = CGPoint(x: 0, y: 1)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        gradientLayer.cornerRadius = layer.cornerRadius
        
        layer.insertSublayer(gradientLayer, at: 0)
        
        if !bounds.isEmpty {
            updateBorderPath()
        }
    }
    
    private func updateBorderPath() {
        gradientLayer.frame = bounds
        let maskPath = UIBezierPath(roundedRect: bounds.insetBy(dx: borderWidth / 2, dy: borderWidth / 2),
                                    cornerRadius: layer.cornerRadius)
        borderLayer.path = maskPath.cgPath
        borderLayer.lineWidth = borderWidth
        borderLayer.fillColor = UIColor.clear.cgColor
        borderLayer.strokeColor = UIColor.black.cgColor
        gradientLayer.mask = borderLayer
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        if !bounds.isEmpty {
            updateBorderPath()
        }
    }
}
