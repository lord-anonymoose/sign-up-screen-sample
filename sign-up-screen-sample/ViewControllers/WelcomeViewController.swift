//
//  ViewController.swift
//  sign-up-screen-sample
//
//  Created by Philipp Lazarev on 26.10.2024.
//

import UIKit

class WelcomeViewController: UIViewController {

    
    
    // MARK: Subviews
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "LogoImage"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "SIS"
        label.font = UIFont.systemFont(ofSize: 34, weight: .medium)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var mottoLabel: UILabel = {
        let label = UILabel()
        label.text = "Choose your security"
        
        // Set font family, size, and weight
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular) // Use .regular for font-weight 400
        label.textColor = UIColor(hex: "#E8E8E8") ?? .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private lazy var loginButton: GradientButton = {
        let button = GradientButton()
        button.setTitle("Log in with phone number", for: .normal)
        
        if let customFont = UIFont(name: "Urbanist-Medium", size: 16) {
            button.titleLabel?.font = customFont
        } else {
            button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        }
        return button
    }()
    
    private lazy var noAccountLabel: UILabel = {
        let label = UILabel()
        label.text = "Don't have an account?"
        label.font = .preferredFont(forTextStyle: .caption1)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    // MARK: Actions
    
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        addSubviews()
        setupConstraints()
    }
    
    
    // MARK: Private
    private func setupUI() {
        view.backgroundColor = StyleGuide.shared.backgroundColor
    }
    
    
    private func addSubviews() {
        view.addSubview(logoImageView)
        view.addSubview(titleLabel)
        view.addSubview(mottoLabel)
        view.addSubview(loginButton)
        view.addSubview(noAccountLabel)
    }
    
    
    private func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 175),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            logoImageView.centerXAnchor.constraint(equalTo: safeAreaGuide.centerXAnchor),

            //logoImageView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 265),
            //logoImageView.heightAnchor.constraint(equalToConstant: 79.27),
            //logoImageView.widthAnchor.constraint(equalToConstant: 79),
            //logoImageView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 234),
            
            titleLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 15),
            titleLabel.heightAnchor.constraint(equalToConstant: 41),
            titleLabel.centerXAnchor.constraint(equalTo: safeAreaGuide.centerXAnchor),
            //titleLabel.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 376),
            //titleLabel.centerXAnchor.constraint(equalTo: safeAreaGuide.centerXAnchor),
            //titleLabel.heightAnchor.constraint(equalToConstant: 41),
            
            mottoLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            //mottoLabel.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 436.29),
            mottoLabel.heightAnchor.constraint(equalToConstant: 22.87),
            mottoLabel.centerXAnchor.constraint(equalTo: safeAreaGuide.centerXAnchor),
            
            
            loginButton.topAnchor.constraint(equalTo: mottoLabel.bottomAnchor, constant: 125),
            //loginButton.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 559),
            loginButton.heightAnchor.constraint(equalToConstant: 56),
            loginButton.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 35),
            loginButton.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -35),
            
            noAccountLabel.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 715),
            noAccountLabel.heightAnchor.constraint(equalToConstant: 40),
            noAccountLabel.centerXAnchor.constraint(equalTo: safeAreaGuide.centerXAnchor)
            
        ])
    }
}

