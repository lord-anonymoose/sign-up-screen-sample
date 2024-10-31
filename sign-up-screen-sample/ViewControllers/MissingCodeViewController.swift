//
//  MissingCodeViewController.swift
//  sign-up-screen-sample
//
//  Created by Philipp Lazarev on 26.10.2024.
//

import UIKit

class MissingCodeViewController: UIViewController {

    
    
    // MARK: Subviews
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = String(localized: "Missing code?")
        if let customFont = UIFont(name: "Inter", size: 24) {
            label.font = customFont
        } else {
            label.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        }
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = String(localized: "Missing code? \nContact our support team")
        if let customFont = UIFont(name: "Inter", size: 16) {
            label.font = customFont
        } else {
            label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        }
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var okButton: GradientButton = {
        let button = GradientButton()
        button.setTitle(String(localized: "OK"), for: .normal)
        
        if let customFont = UIFont(name: "Urbanist-Regular", size: 16) {
            button.titleLabel?.font = customFont
        } else {
            button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        }
        button.addTarget(self, action: #selector(okButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
    // MARK: Actions
    @objc func okButtonTapped() {
        print("OK Button tapped")
        self.navigationController?.popToRootViewController(animated: true)
    }
    
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
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(okButton)
    }
    
    
    private func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        // Constraints that are provided in Figma design yet don't look good on real devices are commented and replaced

        NSLayoutConstraint.activate([
            //titleLabel.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 157),
            titleLabel.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 50),
            titleLabel.heightAnchor.constraint(equalToConstant: 55),
            titleLabel.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 95),
            titleLabel.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -95),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25),
            subtitleLabel.heightAnchor.constraint(equalToConstant: 60),
            subtitleLabel.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 97),
            subtitleLabel.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -97),
            
            //okButton.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 466),
            okButton.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 150),
            okButton.heightAnchor.constraint(equalToConstant: 56),
            okButton.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 35),
            okButton.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -35),
        ])
    }
}
