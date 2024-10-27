//
//  LogInViewController.swift
//  sign-up-screen-sample
//
//  Created by Philipp Lazarev on 26.10.2024.
//

import UIKit

class LogInViewController: UIViewController {

    
    
    // MARK: Subviews
    private lazy var gradientTextField: GradientTextField = {
        let textField = GradientTextField()
        textField.placeholder = String(localized: "Email")
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    
    // MARK: Actions
    
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBackButton()
        setNavigationBarTitle(String(localized: "Log In"))
        addSubviews()
        setupConstraints()
    }
    

    
    // MARK: Private
    
    private func addSubviews() {
        view.addSubview(gradientTextField)
    }
    
    
    private func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        // Constraints that are provided in Figma design yet don't look good on real devices are commented and replaced
        NSLayoutConstraint.activate([
            gradientTextField.centerXAnchor.constraint(equalTo: safeAreaGuide.centerXAnchor),
            gradientTextField.centerYAnchor.constraint(equalTo: safeAreaGuide.centerYAnchor),
            gradientTextField.heightAnchor.constraint(equalToConstant: 50),
            gradientTextField.widthAnchor.constraint(equalToConstant: 50)
            
        ])
    }
}
