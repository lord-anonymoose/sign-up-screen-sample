//
//  FoundationExt.swift
//  sign-up-screen-sample
//
//  Created by Philipp Lazarev on 26.10.2024.
//

import Foundation
import UIKit
/*
extension String {
    var localized: String {
        String(localized: String.LocalizationValue(self))
    }
}

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
*/

extension Int {
    var  secondsToTime: String {
        let minutes = self / 60
        let remainingSeconds = self % 60
        return String(format: "%02d:%02d", minutes, remainingSeconds)
    }
}

extension String {
    func addImage(image: UIImage, font: UIFont, pointSize: CGFloat) -> NSAttributedString {
        let imageConfig = UIImage.SymbolConfiguration(pointSize: pointSize, weight: .regular, scale: .default)

        let symbolAttachment = NSTextAttachment()
        symbolAttachment.image = image.withTintColor(.white, renderingMode: .alwaysOriginal).withConfiguration(imageConfig)
        
        let attributedString = NSMutableAttributedString(
            string: "\(self) ",
            attributes: [
                .foregroundColor: UIColor.white,
                .font: font
            ]
        )
        
        attributedString.append(NSAttributedString(attachment: symbolAttachment))
        return attributedString
    }
}
