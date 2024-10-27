//
//  UIViewController.swift
//  sign-up-screen-sample
//
//  Created by Philipp Lazarev on 27.10.2024.
//

import Foundation
import UIKit



extension UIViewController {
    
    func hideNavigationBar() {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func setupUI() {
        view.backgroundColor = StyleGuide.shared.backgroundColor
    }
    
    func setupBackButton() {
        let backImage = UIImage(systemName: "arrow.left")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        self.navigationController?.navigationBar.backIndicatorImage = backImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backImage
        
        self.navigationItem.backButtonTitle = ""
    }
    
    func setNavigationBarTitle(_ title: String) {
        self.navigationItem.title = title
        
        var customFont = UIFont.systemFont(ofSize: 20, weight: .regular)
        
        if let urbanistFont = UIFont(name: "Urbanist-Regular", size: 20) {
            customFont = urbanistFont
        }
        
        self.navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font: customFont
        ]
    }
}
