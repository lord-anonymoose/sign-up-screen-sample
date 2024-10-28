//
//  SignUpViewController.swift
//  sign-up-screen-sample
//
//  Created by Philipp Lazarev on 26.10.2024.
//

import UIKit
import PhoneNumberKit

final class SignUpViewController: UIViewController {

    
        
    // MARK: - Properties
    let arrowImage = UIImage(systemName: "arrowtriangle.down.fill")!
    let customFont = UIFont(name: "Inter", size: 19) ?? UIFont.systemFont(ofSize: 19, weight: .regular)
    
    private var selectedOption: String? {
        didSet {
            let title = selectedOption?.filter { "+0123456789".contains($0) } ?? ""
            pickerButton.setAttributedTitle(title.addImage(image: arrowImage, font: customFont, pointSize: 15.0), for: .normal)
        }
    }

    
    
    // MARK: - Subviews
    private lazy var pickerButton: GradientBorderedButton = {
        let button = GradientBorderedButton()
        let title = ""
        button.setAttributedTitle(title.addImage(image: arrowImage, font: customFont, pointSize: 15.0), for: .normal)
        button.titleLabel?.textAlignment = .right
        button.showsMenuAsPrimaryAction = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        addSubviews()
        setupConstraints()
        setupMenu()
    }
    
    
    
    // MARK: - Private
    private func addSubviews() {
        view.addSubview(pickerButton)
    }
    
    private func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            pickerButton.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 75),
            //pickerButton.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 215),
            pickerButton.heightAnchor.constraint(equalToConstant: 50),
            pickerButton.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 34),
            pickerButton.widthAnchor.constraint(equalToConstant: 70)
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
        let uniqueCountryCodes = Array(Set(countryCodes)).sorted(by: { $0 > $1 })

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
