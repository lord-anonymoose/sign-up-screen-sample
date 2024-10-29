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
        return textField
    }()
        
    private lazy var grayCircles: [UIView] = (0...3).map { _ in
        let circle = UIView()
        circle.backgroundColor = UIColor(hex: "#999999") ?? .systemGray
        circle.layer.cornerRadius = 10
        circle.translatesAutoresizingMaskIntoConstraints = false
        return circle
    }
    
    private lazy var gradientCircles: [GradientButton] = (0...3).map { _ in
        let circle = GradientButton()
        circle.layer.cornerRadius = 10
        circle.isUserInteractionEnabled = true
        circle.isHidden = true
        return circle
    }
    
    
    
    // MARK: Actions
    
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        passcodeTextField.delegate = self
        setupUI()
        setupBackButton()
        setNavigationBarTitle(String(localized: "Passcode"))
        addSubviews()
        setupConstraints()
    }
    
    
    // MARK: Private
    private func addSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(passcodeTextField)
        
        for circle in grayCircles {
            view.addSubview(circle)
        }
        
        for circle in gradientCircles {
            view.addSubview(circle)
        }
    }
    
    
    private func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        let circleHeight: CGFloat = 20
        let textFieldWidth = view.frame.width - 105*2
        let circlePadding = (textFieldWidth - 20*4) / 5
        //print(passcodeTextField.fr)
        
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
            passcodeTextField.heightAnchor.constraint(equalToConstant: 52),
            passcodeTextField.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 105),
            passcodeTextField.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -105),
            
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
        showGradientCircles(updatedText.count)
        textField.text = updatedText
        print(textField.text)
        return false
    }
}
