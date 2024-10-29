//
//  PasscodeViewController.swift
//  sign-up-screen-sample
//
//  Created by Philipp Lazarev on 26.10.2024.
//

import UIKit

class PasscodeViewController: UIViewController {

    
    
    // MARK: Subviews
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        let title = String(localized: "Create app passcode")
        label.text = title
        label.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        let title = String(localized: "Enter code")
        label.text = title
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = UIColor(hex: "#999999") ?? .systemGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var passcodeTextField: GradientTextField = {
        let textField = GradientTextField()
        //textField.layer.cornerRadius = 100
        textField.layer.cornerRadius = 26
        textField.textColor = .clear
        textField.tintColor = .clear
        textField.keyboardType = .numberPad
        textField.accessibilityLabel = ""
        textField.actionEnabled = false
        return textField
    }()
    
    // Button that overlays passcodeTextField so user can't copy, speak or spell content from it
    // Reference: https://stackoverflow.com/questions/79136657/disable-autofill-speak-and-spell-for-uitextfield
    private lazy var passcodeBlockButton: UIButton = {
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(passcodeBlockButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var grayCircles: [UIView] = (0...3).map { _ in
        let circle = UIView()
        circle.backgroundColor = UIColor(hex: "#999999") ?? .systemGray
        circle.layer.cornerRadius = 5
        circle.translatesAutoresizingMaskIntoConstraints = false
        return circle
    }
    
    private lazy var gradientCircles: [GradientButton] = (0...3).map { _ in
        let circle = GradientButton()
        circle.layer.cornerRadius = 5
        circle.isUserInteractionEnabled = true
        circle.isHidden = true
        return circle
    }
    
    private lazy var proceedButton: GradientButton = {
        let button = GradientButton()
        let title = String(localized: "Proceed")
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont(name: "Urbanist", size: 16) ?? UIFont.systemFont(ofSize: 19, weight: .regular)
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(proceedButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var skipButton: UIButton = {
        let button = UIButton()
        let title = String(localized: "Skip")
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont(name: "Urbanist", size: 16) ?? UIFont.systemFont(ofSize: 19, weight: .regular)
        button.layer.cornerRadius = 25
        button.backgroundColor = UIColor(hex: "#181528")
        button.addTarget(self, action: #selector(skipButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    
    // MARK: Actions
    @objc func passcodeBlockButtonTapped() {
        if passcodeTextField.isFirstResponder {
            passcodeTextField.resignFirstResponder()
        } else {
            passcodeTextField.becomeFirstResponder()
        }
    }
    
    @objc func proceedButtonTapped() {
        let viewController = SuccessViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func skipButtonTapped() {
        let viewController = MainViewController()
        self.navigationController?.setViewControllers([viewController], animated: true)
    }

    
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        passcodeTextField.delegate = self
        setupUI()
        setupBackButton()
        setNavigationBarTitle(String(localized: "Passcode"))
        addSubviews()
        setupConstraints()
        passcodeTextField.becomeFirstResponder()
        disableProceedButton()
    }
    
    // MARK: Private
    private func addSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(passcodeTextField)
        view.addSubview(passcodeBlockButton)
        
        for circle in grayCircles {
            view.addSubview(circle)
        }
        
        for circle in gradientCircles {
            view.addSubview(circle)
        }
        
        view.addSubview(proceedButton)
        view.addSubview(skipButton)
    }
    
    
    private func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        let circleHeight: CGFloat = 10
        let textFieldWidth = view.frame.width - 105*2
        let circlePadding = (textFieldWidth - circleHeight*4) / 5
        
        // Constraints that are provided in Figma design yet don't look good on real devices are commented and replaced
        NSLayoutConstraint.activate([
            //titleLabel.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 169),
            titleLabel.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 75),
            titleLabel.heightAnchor.constraint(equalToConstant: 29),
            titleLabel.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 36),
            titleLabel.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -36),
            
            //subtitleLabel.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 245),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
            subtitleLabel.heightAnchor.constraint(equalToConstant: 20),
            subtitleLabel.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 104),
            subtitleLabel.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -104),
            
            //passcodeTextField.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 301),
            passcodeTextField.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 50),
            passcodeTextField.heightAnchor.constraint(equalToConstant: 56),
            passcodeTextField.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 105),
            passcodeTextField.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -105),
            
            passcodeBlockButton.topAnchor.constraint(equalTo: passcodeTextField.topAnchor),
            passcodeBlockButton.bottomAnchor.constraint(equalTo: passcodeTextField.bottomAnchor),
            passcodeBlockButton.leadingAnchor.constraint(equalTo: passcodeTextField.leadingAnchor),
            passcodeBlockButton.trailingAnchor.constraint(equalTo: passcodeTextField.trailingAnchor),
            
            proceedButton.topAnchor.constraint(equalTo: passcodeBlockButton.bottomAnchor, constant: 50),
            proceedButton.heightAnchor.constraint(equalToConstant: 50),
            proceedButton.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 35),
            proceedButton.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -35),
            
            skipButton.topAnchor.constraint(equalTo: proceedButton.bottomAnchor, constant: 15),
            skipButton.heightAnchor.constraint(equalTo: proceedButton.heightAnchor),
            skipButton.leadingAnchor.constraint(equalTo: proceedButton.leadingAnchor),
            skipButton.trailingAnchor.constraint(equalTo: proceedButton.trailingAnchor),
            
            grayCircles[0].centerYAnchor.constraint(equalTo: passcodeTextField.centerYAnchor),
            grayCircles[0].heightAnchor.constraint(equalToConstant: circleHeight),
            grayCircles[0].widthAnchor.constraint(equalToConstant: circleHeight),
            grayCircles[0].leadingAnchor.constraint(equalTo: passcodeTextField.leadingAnchor, constant: circlePadding),
        ])
        
        for i in 1...3 {
            NSLayoutConstraint.activate([
                grayCircles[i].centerYAnchor.constraint(equalTo: grayCircles[i-1].centerYAnchor),
                grayCircles[i].heightAnchor.constraint(equalTo: grayCircles[i-1].heightAnchor),
                grayCircles[i].widthAnchor.constraint(equalTo: grayCircles[i-1].widthAnchor),
                grayCircles[i].leadingAnchor.constraint(equalTo: grayCircles[i-1].trailingAnchor, constant: circlePadding)
            ])
        }
        
        for i in 0...3 {
            NSLayoutConstraint.activate([
                gradientCircles[i].centerYAnchor.constraint(equalTo: grayCircles[i].centerYAnchor),
                gradientCircles[i].heightAnchor.constraint(equalTo: grayCircles[i].heightAnchor),
                gradientCircles[i].centerXAnchor.constraint(equalTo: grayCircles[i].centerXAnchor),
                gradientCircles[i].widthAnchor.constraint(equalTo: grayCircles[i].widthAnchor)
            ])
        }
    }
    
    private func showGradientCircles(_ count: Int) {
        guard count < 5 else {
            return
        }
        
        guard count > 0 else {
            for circle in gradientCircles {
                circle.isHidden = true
            }
            for circle in grayCircles {
                circle.isHidden = false
            }
            return
        }
        
        var i = 0
        while i < count {
            gradientCircles[i].isHidden = false
            i += 1
        }
        
        var j = grayCircles.count
        while j > count {
            gradientCircles[i].isHidden = true
            grayCircles[i].isHidden = false
            j -= 1
        }
    }
    
    private func disableProceedButton() {
        proceedButton.layer.opacity = 0.5
        proceedButton.isUserInteractionEnabled = false
    }
    
    private func enableProceedButton() {
        proceedButton.layer.opacity = 1.0
        proceedButton.isUserInteractionEnabled = true
    }
}



extension PasscodeViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        
        guard allowedCharacters.isSuperset(of: characterSet) else {
            return false
        }
        
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        guard updatedText.count < 5 else { return false }
        if updatedText.count == 4 {
            if !proceedButton.isUserInteractionEnabled {
                enableProceedButton()
            }
        } else {
            if proceedButton.isUserInteractionEnabled {
                disableProceedButton()
            }
        }
        showGradientCircles(updatedText.count)
        textField.text = updatedText
        return false
    }
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(copy(_:)) ||
           action == #selector(select(_:)) ||
           action == #selector(selectAll(_:)) {
            return false
        }
        return super.canPerformAction(action, withSender: sender)
    }
}
