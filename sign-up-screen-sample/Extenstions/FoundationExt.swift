//
//  FoundationExt.swift
//  sign-up-screen-sample
//
//  Created by Philipp Lazarev on 26.10.2024.
//

import Foundation
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
