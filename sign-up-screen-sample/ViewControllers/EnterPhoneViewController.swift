//
//  SignUpViewController.swift
//  sign-up-screen-sample
//
//  Created by Philipp Lazarev on 26.10.2024.
//

import UIKit
import PhoneNumberKit

final class EnterPhoneViewController: UIViewController {
    
    
    
    // MARK: - Properties
    private var isRegistered: Bool

    let arrowImage = UIImage(systemName: "arrowtriangle.down.fill")!
    let phoneNumberFont = UIFont(name: "Inter", size: 19) ?? UIFont.systemFont(ofSize: 19, weight: .regular)
    let labelFont = UIFont(name: "Urbanist", size: 15) ?? UIFont.systemFont(ofSize: 15, weight: .regular)
    
    private var selectedOption: String? {
        didSet {
            let title = selectedOption?.filter { "+0123456789".contains($0) } ?? ""
            pickerButton.setAttributedTitle(title.addImage(image: arrowImage, font: phoneNumberFont, pointSize: 15.0), for: .normal)
        }
    }
    
    
    
    // MARK: - Subviews
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = String(localized: "Phone number")
        label.textAlignment = .left
        label.font = labelFont
        label.textColor = UIColor(hex: "#E1E1E1") ?? .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var pickerButton: GradientBorderedButton = {
        let button = GradientBorderedButton()
        let title = ""
        button.setAttributedTitle(title.addImage(image: arrowImage, font: phoneNumberFont, pointSize: 15.0), for: .normal)
        button.titleLabel?.textAlignment = .right
        button.showsMenuAsPrimaryAction = true
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var phoneTextField: GradientTextField = {
        let textField = GradientTextField()
        textField.font = phoneNumberFont
        textField.textColor = .white
        textField.layer.cornerRadius = 10
        return textField
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = String(localized: "You will get an SMS with confirmation code")
        label.font = labelFont
        label.textAlignment = .center
        label.textColor = UIColor(hex: "#E1E1E1") ?? .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var proceedButton: GradientButton = {
        let button = GradientButton()
        let title = String(localized: "Get code")
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont(name: "Urbanist", size: 16) ?? UIFont.systemFont(ofSize: 16, weight: .regular)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.textColor = .white
        button.addTarget(self, action: #selector(proceedButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
    
    // MARK: Actions
    @objc func proceedButtonTapped() {
        let viewController = VerificationViewController(isRegistered: isRegistered)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    
    
    // MARK: - Lifecycle
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
        if isRegistered {
            setNavigationBarTitle(String(localized: "Log In"))
        } else {
            setNavigationBarTitle(String(localized: "Sign Up"))
        }
        addSubviews()
        setupConstraints()
        setupMenu()
    }
    
    
    
    // MARK: - Private
    private func addSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(pickerButton)
        view.addSubview(phoneTextField)
        view.addSubview(subtitleLabel)
        view.addSubview(proceedButton)
    }
    
    private func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            //titleLabel.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 135),
            titleLabel.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 45),
            titleLabel.heightAnchor.constraint(equalToConstant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 34),
            //titleLabel.widthAnchor.constraint(equalToConstant: 113),
            titleLabel.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -34),
            
            pickerButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            //pickerButton.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 215),
            pickerButton.heightAnchor.constraint(equalToConstant: 50),
            pickerButton.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            pickerButton.widthAnchor.constraint(equalToConstant: 70),
            
            phoneTextField.topAnchor.constraint(equalTo: pickerButton.topAnchor),
            phoneTextField.heightAnchor.constraint(equalTo: pickerButton.heightAnchor),
            phoneTextField.leadingAnchor.constraint(equalTo: pickerButton.trailingAnchor, constant: 15),
            phoneTextField.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            subtitleLabel.topAnchor.constraint(equalTo: pickerButton.bottomAnchor, constant: 15),
            subtitleLabel.heightAnchor.constraint(equalToConstant: 17),
            subtitleLabel.centerXAnchor.constraint(equalTo: safeAreaGuide.centerXAnchor),
            subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            proceedButton.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 50),
            proceedButton.heightAnchor.constraint(equalToConstant: 56),
            proceedButton.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            proceedButton.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)
        ])
    }
    
    private func setupMenu() {
        let phoneNumberUtility = PhoneNumberUtility()
        var countryCodes = [String]()

        for regionCode in phoneNumberUtility.allCountries() {
            if let countryCode = phoneNumberUtility.countryCode(for: regionCode) {
                let flag = flagEmoji(for: regionCode)
                countryCodes.append("+\(countryCode) \(flag)")
            }
        }
        let uniqueCountryCodes = Array(Set(countryCodes)).sorted(by: { $0 < $1 })

        let menuItems = uniqueCountryCodes.map { option in
            UIAction(title: option) { [weak self] _ in
                self?.selectedOption = option
            }
        }
        let title = String(localized: "Choose an Option")
        pickerButton.menu = UIMenu(title: title, options: .displayInline, children: menuItems)
    }
    
    private func flagEmoji(for regionCode: String) -> String {
        let base: UInt32 = 127397
        var flagString = ""
        if regionCode == "001" {
            return "🇺🇸"
        }
        for scalar in regionCode.uppercased().unicodeScalars {
            flagString.unicodeScalars.append(UnicodeScalar(base + scalar.value)!)
        }
        return flagString
    }
}
