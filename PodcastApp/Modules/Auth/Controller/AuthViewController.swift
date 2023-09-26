//
//  OnboardingViewController.swift
//  PodcastApp
//
//  Created by Дмитрий Лоренц on 24.09.2023.
//

import UIKit
import SnapKit

final class AuthViewController: UIViewController {
    
    // MARK: - Private Properties
    private let loginView = LoginView()
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(loginView)
        setupConcstaints()
        
        loginView.registerStackView.actionButton.addTarget(
            self,
            action: #selector(registerButtonDidTapped),
            for: .touchUpInside)
    }
    
    // MARK: - Private Actions
    // переход на экран createAccountVC
    @objc private func registerButtonDidTapped() {
        let createAccVC = CreateAccountViewController()
//        createAccVC.modalPresentationStyle = .fullScreen
//        showDetailViewController(createAccVC, sender: nil)
        navigationController?.pushViewController(createAccVC, animated: true)
    }
    
    // MARK: - Private Methods
    private func setupConcstaints() {
        loginView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
