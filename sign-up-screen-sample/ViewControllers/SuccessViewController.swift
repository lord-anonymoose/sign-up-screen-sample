//
//  SuccessViewController.swift
//  sign-up-screen-sample
//
//  Created by Philipp Lazarev on 26.10.2024.
//

import UIKit

class SuccessViewController: UIViewController {

    
    
    // MARK: Subviews
    private lazy var successLabel: UILabel = {
        let label = UILabel()
        label.text = String(localized: "You have successfully created code for the application")
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.backgroundColor = StyleGuide.shared.secondaryBackgroundColor
        label.layer.cornerRadius = 20
        label.textAlignment = .center
        label.numberOfLines = 0
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var proceedButton: UIButton = {
        let button = UIButton()
        let title = String(localized: "Proceed to the app")
        button.setTitle(title, for: .normal)
        button.setTitleColor(StyleGuide.shared.lightBlue, for: .normal)
        if let customFont = UIFont(name: "Poppins-Regular", size: 17) {
            button.titleLabel?.font = customFont
        } else {
            button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        }
        button.backgroundColor = StyleGuide.shared.secondaryBackgroundColor
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(proceedButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    
    // MARK: Actions
    @objc func proceedButtonTapped() {
        let viewController = MainViewController()
        self.navigationController?.setViewControllers([viewController], animated: true)
    }
    
    
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        hideNavigationBar()
        setupUI()
        setupBackButton()
        setNavigationBarTitle(String(localized: "Log In"))
        addSubviews()
        setupConstraints()
    }
    

    
    // MARK: Private
    
    private func addSubviews() {
        view.addSubview(successLabel)
        view.addSubview(proceedButton)
    }
    
    
    private func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        // Constraints that are provided in Figma design yet don't look good on real devices are commented and replaced
        NSLayoutConstraint.activate([
            //successLabel.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 325),
            successLabel.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 250),
            successLabel.heightAnchor.constraint(equalToConstant: 118),
            successLabel.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 30),
            successLabel.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -30),
            
            proceedButton.topAnchor.constraint(equalTo: successLabel.bottomAnchor, constant: 25),
            proceedButton.heightAnchor.constraint(equalToConstant: 68),
            proceedButton.leadingAnchor.constraint(equalTo: successLabel.leadingAnchor),
            proceedButton.trailingAnchor.constraint(equalTo: successLabel.trailingAnchor)
        ])
    }
}
