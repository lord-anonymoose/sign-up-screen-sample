//
//  MainViewController.swift
//  sign-up-screen-sample
//
//  Created by Philipp Lazarev on 30.10.2024.
//

import Foundation
import UIKit



class MainViewController: UIViewController {

    
    
    // MARK: Subviews
    private lazy var imageView: UIImageView  = {
        let image = UIImage(named: "LogoImage")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setNavigationBarTitle("SIS")
        addSubviews()
        setupConstraints()
    }
    
    
    // MARK: Private
    private func addSubviews() {
        view.addSubview(imageView)
    }
    
    private func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: safeAreaGuide.centerYAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            imageView.centerXAnchor.constraint(equalTo: safeAreaGuide.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
}
