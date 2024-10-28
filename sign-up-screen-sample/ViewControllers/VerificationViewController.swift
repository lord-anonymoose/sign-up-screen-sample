//
//  VerificationViewController.swift
//  sign-up-screen-sample
//
//  Created by Philipp Lazarev on 27.10.2024.
//

import UIKit

class VerificationViewController: UIViewController {

    
    
    // MARK: - Properties
    private var isRegistered: Bool
    private var timer: Timer?
    var timeLeft: Int = 10
    
    
    
    // MARK: Subviews
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = String(localized: "Verification")
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
        label.text = String(localized: "Enter a code from SMS")
        if let customFont = UIFont(name: "Inter", size: 16) {
            label.font = customFont
        } else {
            label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        }
        label.textColor = StyleGuide.shared.lightGray
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var countdownLabel: UILabel = {
        let label = UILabel()
        label.text = String(localized: "You can request a new code in \(timeLeft.secondsToTime)")
        if let customFont = UIFont(name: "Inter", size: 16) {
            label.font = customFont
        } else {
            label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        }
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var requestCodeButton: UIButton = {
        let button = UIButton()
        
        button.setTitle(String(localized: "Request new code"), for: .normal)
        if let customFont = UIFont(name: "Inter", size: 16) {
            button.titleLabel?.font = customFont
        } else {
            button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        }
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.textColor = .white
        button.underlineText()
        button.addTarget(self, action: #selector(requestCodeButtonTapped), for: .touchUpInside)
        button.isHidden = true
        button.isUserInteractionEnabled = false
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var gradientTextField: GradientTextField = {
        let textField = GradientTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var gradientTextFields: [GradientTextField] = (0...5).map { _ in GradientTextField() }
    
    private lazy var proceedButton: GradientButton = {
        let button = GradientButton()
        if isRegistered {
            button.setTitle(String(localized: "Log In"), for: .normal)
        } else {
            button.setTitle(String(localized: "Sign Up"), for: .normal)
        }
        
        if let customFont = UIFont(name: "Inter", size: 16) {
            button.titleLabel?.font = customFont
        } else {
            button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        }
        button.addTarget(self, action: #selector(proceedButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var missingCodeButton: UIButton = {
        let button = UIButton()
        
        button.setTitle(String(localized: "I didn't get a code!"), for: .normal)
        if let customFont = UIFont(name: "Inter", size: 14) {
            button.titleLabel?.font = customFont
        } else {
            button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        }
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.textColor = .white
        button.underlineText()
        button.addTarget(self, action: #selector(missingCodeButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    // MARK: Actions
    @objc func proceedButtonTapped() {
        print("ProceedButtonTapped")
    }
    
    @objc func requestCodeButtonTapped() {
        print("Request Code Button Tapped")
    }
    
    @objc func missingCodeButtonTapped() {
        let viewController = MissingCodeViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    // MARK: Lifecycle
    init(isRegistered: Bool) {
        self.isRegistered = isRegistered
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBackButton()
        if isRegistered {
            setNavigationBarTitle(String(localized: "Log In"))
        } else {
            setNavigationBarTitle(String(localized: "Sign Up"))
        }
        addSubviews()
        setupConstraints()
        setupDelegates()
        startTimer()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stopTimer()
    }

    
    // MARK: Private
    
    private func addSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(countdownLabel)
        view.addSubview(proceedButton)
        view.addSubview(requestCodeButton)
        view.addSubview(missingCodeButton)
        for textField in gradientTextFields {
            view.addSubview(textField)
        }
    }
        
    private func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            //titleLabel.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 168.38),
            titleLabel.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 75),
            titleLabel.heightAnchor.constraint(equalToConstant: 30.14),
            titleLabel.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 116),
            titleLabel.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -116),
            
            //subtitleLabel.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 216.2),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25),
            subtitleLabel.heightAnchor.constraint(equalToConstant: 39.5),
            subtitleLabel.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 107.68),
            subtitleLabel.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -107.68),
            
            //countdownLabel.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 291),
            countdownLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 50),
            countdownLabel.heightAnchor.constraint(equalToConstant: 50),
            countdownLabel.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 108),
            countdownLabel.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -108),
            
            requestCodeButton.topAnchor.constraint(equalTo: countdownLabel.topAnchor),
            requestCodeButton.heightAnchor.constraint(equalTo: countdownLabel.heightAnchor),
            requestCodeButton.leadingAnchor.constraint(equalTo: countdownLabel.leadingAnchor),
            requestCodeButton.trailingAnchor.constraint(equalTo: countdownLabel.trailingAnchor),
        ])
        
        let sidePadding: CGFloat = 20
        let cellWidth: CGFloat = 50
        
        let totalPadding = sidePadding * 2 + cellWidth * 6
        let padding = (safeAreaGuide.layoutFrame.width - totalPadding) / 5
        
        NSLayoutConstraint.activate([
            gradientTextFields[0].leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: sidePadding),
            gradientTextFields[0].centerYAnchor.constraint(equalTo: safeAreaGuide.centerYAnchor),
            gradientTextFields[0].heightAnchor.constraint(equalToConstant: cellWidth),
            gradientTextFields[0].widthAnchor.constraint(equalToConstant: cellWidth),
            
            //proceedButton.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 437),
            proceedButton.topAnchor.constraint(equalTo: gradientTextFields[0].bottomAnchor, constant: 25),
            //proceedButton.heightAnchor.constraint(equalToConstant: 50),
            proceedButton.heightAnchor.constraint(equalToConstant: 56),
            //proceedButton.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 78),
            //proceedButton.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -78)
            proceedButton.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 35),
            proceedButton.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -35),
            
            //missingCodeButton.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 518),
            missingCodeButton.topAnchor.constraint(equalTo: proceedButton.bottomAnchor, constant: 25),
            missingCodeButton.heightAnchor.constraint(equalToConstant: 20),
            missingCodeButton.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 132),
            missingCodeButton.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -132)
        ])
        
        for i in 1...5 {
            NSLayoutConstraint.activate([
                gradientTextFields[i].leadingAnchor.constraint(equalTo: gradientTextFields[i-1].trailingAnchor, constant: padding),
                gradientTextFields[i].centerYAnchor.constraint(equalTo: gradientTextFields[i-1].centerYAnchor),
                gradientTextFields[i].heightAnchor.constraint(equalTo: gradientTextFields[i-1].heightAnchor),
                gradientTextFields[i].widthAnchor.constraint(equalTo: gradientTextFields[i-1].widthAnchor)
            ])
        }
    }
    
    private func setupDelegates() {
        for gradientTextField in gradientTextFields {
            gradientTextField.delegate = self
        }
    }
    
    func startTimer() {
        self.countdownLabel.isHidden = false
        self.requestCodeButton.isHidden = true
        self.requestCodeButton.isUserInteractionEnabled = false
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [unowned self] timer in
            if timeLeft > 0 {
                timeLeft -= 1
                countdownLabel.text = String(localized: "You can request a new code in \(timeLeft.secondsToTime)")
            } else {
                stopTimer()
                self.countdownLabel.isHidden = true
                self.requestCodeButton.isHidden = false
                self.requestCodeButton.isUserInteractionEnabled = true
            }
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}

extension VerificationViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        
        guard allowedCharacters.isSuperset(of: characterSet) else {
            return false
        }
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        print("Action happens")
        return updatedText.count <= 1
    }
}


