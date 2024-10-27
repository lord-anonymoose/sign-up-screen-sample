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
        let backImage = UIImage(systemName: "arrow.left")
        self.navigationController?.navigationBar.backIndicatorImage = backImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backImage
        
        self.navigationItem.backButtonTitle = ""
    }
    
    func setNavigationBarTitle(_ title: String) {
        self.navigationItem.title = title
        
        self.navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font: UIFont.systemFont(ofSize: 17, weight: .semibold)
        ]
    }
}
