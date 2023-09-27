//
//  OnboardingViewController.swift
//  PodcastApp
//
//  Created by Дмитрий Лоренц on 24.09.2023.
//

import UIKit
import SnapKit

final class AuthViewController: UIViewController {
    
    // MARK: - UI Components
    private let loginLabel = CustomLabel(
        title: "Enter login",
        font: UIFont.systemFont(ofSize: 15),
        color: #colorLiteral(red: 0.4863581657, green: 0.4862256646, blue: 0.4821705818, alpha: 1)
    )
    
    private let loginField = CustomTextField(
        fieldType: .withEyeButton,
        placeholder: "Login",
        border: true
    )
    
    private let passwordLabel = CustomLabel(
        title: "Password",
        font: UIFont.systemFont(ofSize: 15),
        color: #colorLiteral(red: 0.4863581657, green: 0.4862256646, blue: 0.4821705818, alpha: 1)
    )
    
    private let passwordField = CustomTextField(
        fieldType: .withEyeButton,
        placeholder: "Password",
        border: true
    )
    
    private let loginButton = CustomButton(
        title: "Login",
        font: UIFont.boldSystemFont(ofSize: 18),
        buttonType: .blueButton
    )
    
    private let continueView = ContinueView()
    
    private let googleButton = CustomButton(
        title: "Continue with Google",
        font: UIFont.boldSystemFont(ofSize: 18),
        buttonType: .googleButton
    )
    
    private lazy var registerStackView: AuthStackView = {
        var registrSV = AuthStackView(authType: .register)
        return registrSV
    }()

    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        view.backgroundColor = .white
    
        setupConstraints()
  
    }
    
    // MARK: - Private Actions
    
    // MARK: - Private Methods
    private func addViews() {
        view.addSubview(loginLabel)
        view.addSubview(loginField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
        view.addSubview(continueView)
        view.addSubview(googleButton)
        view.addSubview(registerStackView)
    }
    
    private func setupConstraints() {
        loginLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(120)
            make.left.equalToSuperview().offset(16)
        }
        
        loginField.snp.makeConstraints { make in
            make.top.equalTo(loginLabel.snp.bottom).offset(7)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(45)
        }
        
        passwordLabel.snp.makeConstraints { make in
            make.top.equalTo(loginField.snp.bottom).offset(12)
            make.left.equalToSuperview().offset(16)
        }
        
        passwordField.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom).offset(7)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(45)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordField.snp.bottom).offset(24)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(57)
        }
        
        continueView.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(45)
            make.centerX.equalToSuperview()
        }
        
        googleButton.snp.makeConstraints { make in
            make.top.equalTo(continueView.snp.bottom).offset(56)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-24)
            make.height.equalTo(56)
        }
        
        registerStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-50)
        }
        
    }
}


