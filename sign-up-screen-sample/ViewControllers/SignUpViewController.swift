//
//  SignUpViewController.swift
//  sign-up-screen-sample
//
//  Created by Philipp Lazarev on 26.10.2024.
//

import UIKit

class SignUpViewController: UIViewController {

    
    
    // MARK: Subviews
    
    
    
    // MARK: Actions
    
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBackButton()
        addSubviews()
        setupConstraints()
    }
    
    
    // MARK: Private
    private func addSubviews() {
        
    }
    
    
    private func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        // Constraints that are provided in Figma design yet don't look good on real devices are commented and replaced
    }
}
