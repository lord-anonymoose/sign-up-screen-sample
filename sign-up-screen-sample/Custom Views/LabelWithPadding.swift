//
//  LabelWithPadding.swift
//  sign-up-screen-sample
//
//  Created by Philipp Lazarev on 27.10.2024.
//

import Foundation
import UIKit

class LabelWithPadding: UILabel {
    var textInsets = UIEdgeInsets(top: 10, left: 25, bottom: 10, right: 25)
    
    override func drawText(in rect: CGRect) {
        let insets = textInsets
        super.drawText(in: rect.inset(by: insets))
    }
    
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + textInsets.left + textInsets.right,
                      height: size.height + textInsets.top + textInsets.bottom)
    }
}
