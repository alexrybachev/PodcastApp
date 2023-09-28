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
        font: UIFont.systemFont(ofSize: 15)
    )
    
    let loginField = CustomTextField(
        fieldType: .withEyeButton,
        placeholder: "Login",
        border: true
    )
    
    private let passwordLabel = CustomLabel(
        title: "Password",
        font: UIFont.systemFont(ofSize: 15)
    )
    
    let passwordField = CustomTextField(
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

    private let registerLabel: UILabel = {
        let infoLabel = AuthLabel(
            title: "Don't have an account yet? Register",
            activeString: "Register",
            font: .small
        )
        return infoLabel
    }()
        
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        view.backgroundColor = .white
        
        setupConstraints()
        
        loginField.delegate = self
        passwordField.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(registerButtonDidTapped))
        registerLabel.addGestureRecognizer(tapGesture)
    }
    
    // MARK: - Override Methods
    // метод для скрытия клавиатуры по тапу на экран
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: - Private Actions
    @objc private func registerButtonDidTapped() {
        let createAccVC = CreateAccountViewController()
        navigationController?.pushViewController(createAccVC, animated: true)
//        print("YES")
    }
    
    // MARK: - Private Methods
    private func addViews() {
        view.addSubview(loginLabel)
        view.addSubview(loginField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
        view.addSubview(continueView)
        view.addSubview(googleButton)
        view.addSubview(registerLabel)
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
        
        registerLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-50)
        }
    }
}

// MARK: - UITextFieldDelegate
extension AuthViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
}

