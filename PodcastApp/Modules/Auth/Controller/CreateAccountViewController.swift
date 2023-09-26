//
//  CreateAccauntViewController.swift
//  PodcastApp
//
//  Created by Kirill Taraturin on 25.09.2023.
//

import UIKit

final class CreateAccountViewController: UIViewController {
    
    // MARK: - Private Properties
    private let createAccView = CreateAccountView()
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(createAccView)
        setupConstraints()
        navigationItem.hidesBackButton = true
        
        createAccView.continueButton.addTarget(
            self,
            action: #selector(continueButtonDidTapped),
            for: .touchUpInside
        )
    }
    
    // MARK: - Private Actions
    @objc private func continueButtonDidTapped() {
        
        let registrVC = RegistrationViewController()
        navigationController?.pushViewController(registrVC, animated: true)
    }
    
    // MARK: - Private Methods
    private func setupConstraints() {
        createAccView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
