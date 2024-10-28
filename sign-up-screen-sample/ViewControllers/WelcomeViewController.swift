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
        label.text = String(localized: "SIS")
        label.font = UIFont.systemFont(ofSize: 34, weight: .medium)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var mottoLabel: UILabel = {
        let label = UILabel()
        label.text = String(localized: "Choose your security")
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.textColor = UIColor(hex: "#E8E8E8") ?? .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()    
    
    private lazy var loginButton: GradientButton = {
        let button = GradientButton()
        button.setTitle(String(localized: "Log in with phone number"), for: .normal)
        
        if let customFont = UIFont(name: "Urbanist-Regular", size: 16) {
            button.titleLabel?.font = customFont
        } else {
            button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        }
        
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var noAccountLabel: UILabel = {
        let label = UILabel()
        label.text = String(localized: "Don't have an account?")
        
        if let customFont = UIFont(name: "Urbanist-Regular", size: 14) {
            label.font = customFont
        } else {
            label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        }

        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton()
        
        button.setTitle(String(localized: "Sign up"), for: .normal)
        if let customFont = UIFont(name: "Urbanist-Regular", size: 14) {
            button.titleLabel?.font = customFont
        } else {
            button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        }
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.textColor = StyleGuide.shared.lightBlue
        button.underlineText()
        button.addTarget(self, action: #selector(signupButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    
    // MARK: Actions
    @objc func loginButtonTapped() {
        let loginViewController = VerificationViewController(isRegistered: true)
        navigationController?.pushViewController(loginViewController, animated: true)
    }
    
    @objc func signupButtonTapped() {
        print("Signup button tapped")
        let signupViewController = SignUpViewController()
        navigationController?.pushViewController(signupViewController, animated: true)
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
        view.addSubview(logoImageView)
        view.addSubview(titleLabel)
        view.addSubview(mottoLabel)
        view.addSubview(loginButton)
        view.addSubview(noAccountLabel)
        view.addSubview(signUpButton)
    }
    
    
    private func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        // Constraints that are provided in Figma design yet don't look good on real devices are commented and replaced
        
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
            
            signUpButton.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor, constant: -25),
            signUpButton.heightAnchor.constraint(equalToConstant: 20),
            signUpButton.centerXAnchor.constraint(equalTo: safeAreaGuide.centerXAnchor),
            
            //noAccountLabel.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 715),
            noAccountLabel.bottomAnchor.constraint(equalTo: signUpButton.topAnchor, constant: -10),
            noAccountLabel.heightAnchor.constraint(equalToConstant: 20),
            noAccountLabel.centerXAnchor.constraint(equalTo: safeAreaGuide.centerXAnchor)
        ])
    }
}

