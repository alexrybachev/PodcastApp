//
//  CreateAccauntViewController.swift
//  PodcastApp
//
//  Created by Kirill Taraturin on 25.09.2023.
//

import UIKit

final class CreateAccountViewController: UIViewController {
    
    // MARK: - Private Properties
    private let welcomeLabel = CustomLabel(
        title: "Create account",
        font: UIFont.boldSystemFont(ofSize: 24),
        color: .white
    )
    
    private lazy var whiteView: UIView = {
        var whiteView = UIView()
        whiteView.layer.cornerRadius = 30
        whiteView.backgroundColor = .white
        return whiteView
    }()
    
    private let emailLabel = CustomLabel(
        title: "Email",
        color: #colorLiteral(red: 0.4713656902, green: 0.5105890036, blue: 0.5429269075, alpha: 1)
    )
    
    private let emailField = CustomTextField(
        fieldType: .withoutEyeButton,
        placeholder: "Enter your email address",
        border: false
    )
    
    private lazy var continueButton: CustomButton = {
        var contButton = CustomButton(
            title: "Continue with Email",
            buttonType: .blueButton
        )
        contButton.addTarget(
            self,
            action: #selector(continueButtonDidTapped),
            for: .touchUpInside
        )
        return contButton
    }()
    
    private let continueView = ContinueView()
    
    private let googleButton = CustomButton(
        title: "Continue with Google",
        buttonType: .googleButton
    )
    
    private lazy var loginStackView: AuthStackView = {
        var loginSV = AuthStackView(authType: .login)
        loginSV.actionButton.setTitleColor(#colorLiteral(red: 0.3171662092, green: 0.3071304858, blue: 0.7139448524, alpha: 1), for: .normal)
        loginSV.actionButton.addTarget(
            self, action: #selector(loginButtonDidTapped),
            for: .touchUpInside
        )
        return loginSV
    }()
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.1589552164, green: 0.5085405111, blue: 0.9443863034, alpha: 1)
        addViews()
        setupConstraints()
        
        emailField.delegate = self
        navigationItem.hidesBackButton = true
    }
    
    // MARK: - Override Methods
    // метод для скрытия клавиатуры по тапу на экран
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: - Private Actions
    @objc private func loginButtonDidTapped() {
        // очищаем textField в AuthViewController при возврате на экран
        if let authVC = navigationController?.viewControllers.first as? AuthViewController {
            authVC.loginField.text = ""
            authVC.passwordField.text = ""
        }
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func continueButtonDidTapped() {
        let registerVC = RegistrationViewController()
        navigationController?.pushViewController(registerVC, animated: true)
    }
    
    // MARK: - Private Methods
    private func addViews() {
        view.addSubview(welcomeLabel)
        view.addSubview(whiteView)
        whiteView.addSubview(emailLabel)
        whiteView.addSubview(emailField)
        whiteView.addSubview(continueButton)
        whiteView.addSubview(continueView)
        whiteView.addSubview(googleButton)
        whiteView.addSubview(loginStackView)
    }
    
    private func setupConstraints() {
        welcomeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.centerX.equalToSuperview()
        }
        
        whiteView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(200)
            make.bottom.equalToSuperview().offset(25)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        emailLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(47)
            make.left.equalToSuperview().offset(24)
        }
        
        emailField.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-24)
            make.height.equalTo(60)
        }
        
        continueButton.snp.makeConstraints { make in
            make.top.equalTo(emailField.snp.bottom).offset(32)
            make.left.equalToSuperview().offset(25)
            make.right.equalToSuperview().offset(-25)
            make.height.equalTo(56)
        }
        
        continueView.snp.makeConstraints { make in
            make.top.equalTo(continueButton.snp.bottom).offset(32)
            make.centerX.equalToSuperview()
        }
        
        googleButton.snp.makeConstraints { make in
            make.top.equalTo(continueView.snp.bottom).offset(55)
            make.left.equalToSuperview().offset(25)
            make.right.equalToSuperview().offset(-25)
            make.height.equalTo(56)
        }
        
        loginStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-50)
        }
    }
}

// MARK: - UITextFieldDelegate
extension CreateAccountViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
}
