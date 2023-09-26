//
//  RegistrationView.swift
//  PodcastApp
//
//  Created by Kirill Taraturin on 26.09.2023.
//

import UIKit

final class RegistrationView: UIView {
    
    // MARK: - UI Properties (Labels)
    private lazy var welcomeLabel: UILabel = {
        var welcomeLabel = UILabel.setupCustomLabel(
            text: "Complete your account",
            fontSize: UIFont.boldSystemFont(ofSize: 24)
        )
        welcomeLabel.textColor = .black
        return welcomeLabel
    }()
    
    private lazy var firstNameLabel: UILabel = {
        var firstNameLabel = UILabel.setupCustomLabel(
            text: "First Name",
            fontSize: UIFont.systemFont(ofSize: 14)
        )
        return firstNameLabel
    }()
    
    private lazy var lastNameLabel: UILabel = {
        var lastNameLabel = UILabel.setupCustomLabel(
            text: "Last Name",
            fontSize: UIFont.systemFont(ofSize: 14)
        )
        return lastNameLabel
    }()
    
    private lazy var emailLabel: UILabel = {
        var emailLabel = UILabel.setupCustomLabel(
            text: "Email",
            fontSize: UIFont.systemFont(ofSize: 14)
        )
        return emailLabel
    }()
    
    private lazy var passwordLabel: UILabel = {
        var passwordLabel = UILabel.setupCustomLabel(
            text: "Password",
            fontSize: UIFont.systemFont(ofSize: 14)
        )
        return passwordLabel
    }()
    
    private lazy var confirmPasswordLabel: UILabel = {
        var confirmPasswordLabel = UILabel.setupCustomLabel(
            text: "Confirm Password",
            fontSize: UIFont.systemFont(ofSize: 14)
        )
        return confirmPasswordLabel
    }()
    
    // MARK: - UI Properties (TextFIelds)
    private lazy var firstNameTextField: UITextField = {
        var firstNameTF = UITextField.createCustomTextField(
            placeholder: "Enter your first name"
        )
        setupTextField(firstNameTF)
        return firstNameTF
    }()
    
    private lazy var lastNameTextField: UITextField = {
        var lastNameTF = UITextField.createCustomTextField(
            placeholder: "Enter your last name"
        )
        setupTextField(lastNameTF)
        return lastNameTF
    }()
    
    private lazy var emailTextField: UITextField = {
        var emailTF = UITextField.createCustomTextField(
            placeholder: "Enter your email"
        )
        setupTextField(emailTF)
        return emailTF
    }()
    
    private lazy var passwordTextField: UITextField = {
        var passwordTF = setupCustomTextFieldWithEyeButton(
            placeholder: "Enter you password"
        )
        return passwordTF
    }()
    
    private lazy var confirmPasswordTextField: UITextField = {
        var confirmPasswordTF = setupCustomTextFieldWithEyeButton(
            placeholder: "Enter your password"
        )
        return confirmPasswordTF
    }()
    
    // MARK: - UI Properties (Buttons)
    private lazy var signUpButton: UIButton = {
        var signUpButton = UIButton.createDefaultButton(
            text: "Sign Up"
        )
        return signUpButton
    }()
    
    // MARK: - Other UI Properties
    private lazy var loginStackView: AuthStackView = {
        var loginSV = AuthStackView(authType: .login)
        return loginSV
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        UIView.addSubviews(
            mainView: self,
            subviews: welcomeLabel,
            firstNameLabel,
            firstNameTextField,
            lastNameLabel,
            lastNameTextField,
            emailLabel,
            emailTextField,
            passwordLabel,
            passwordTextField,
            confirmPasswordLabel,
            confirmPasswordTextField,
            signUpButton,
            loginStackView
        )

        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Actions
    @objc private func toggleTextVisibility(_ sender: UIButton) {
        if let textField = sender.superview?.superview as? UITextField {
            textField.isSecureTextEntry.toggle()
            let image = textField.isSecureTextEntry
            ? UIImage(systemName: "eye.slash.fill")
            : UIImage(systemName: "eye.fill")
            sender.setImage(image, for: .normal)
        }
    }
    
    // MARK: - Private Methods
    private func setupConstraints() {
        welcomeLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(25)
            make.centerX.equalToSuperview()
        }
        
        firstNameLabel.snp.makeConstraints { make in
            make.top.equalTo(welcomeLabel.snp.bottom).offset(40)
            make.left.equalToSuperview().offset(24)
        }
        
        firstNameTextField.snp.makeConstraints { make in
            make.top.equalTo(firstNameLabel.snp.bottom).offset(7)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-24)
            make.bottom.equalTo(lastNameLabel.snp.top).offset(-10)
            make.height.equalTo(45)
        }
        
        lastNameLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(24)
        }
        
        lastNameTextField.snp.makeConstraints { make in
            make.top.equalTo(lastNameLabel.snp.bottom).offset(7)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-24)
            make.bottom.equalTo(emailLabel.snp.top).offset(-10)
            make.height.equalTo(45)
        }
        
        emailLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(24)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(7)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-24)
            make.bottom.equalTo(passwordLabel.snp.top).offset(-10)
            make.height.equalTo(45)
        }
        
        passwordLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(24)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom).offset(7)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-24)
            make.bottom.equalTo(confirmPasswordLabel.snp.top).offset(-10)
            make.height.equalTo(45)
        }
        
        confirmPasswordLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(24)
        }
        
        confirmPasswordTextField.snp.makeConstraints { make in
            make.top.equalTo(confirmPasswordLabel.snp.bottom).offset(7)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-24)
            make.bottom.equalTo(signUpButton.snp.top).offset(-18)
            make.height.equalTo(45)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-24)
            make.height.equalTo(50)
        }
        
        loginStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-50)
        }
    }
    
    private func setupTextField(_ textField: UITextField) {
        textField.layer.cornerRadius = 20
        textField.backgroundColor = #colorLiteral(red: 0.964484036, green: 0.9729270339, blue: 0.9972267747, alpha: 1)
    }
    
    private func setupCustomTextFieldWithEyeButton(placeholder: String) -> UITextField {
        let customTF = UITextField
            .createCustomTextField(placeholder: placeholder)
        customTF.layer.cornerRadius = 20
        customTF.backgroundColor = #colorLiteral(red: 0.964484036, green: 0.9729270339, blue: 0.9972267747, alpha: 1)
        customTF.isSecureTextEntry = true
        
        customTF.rightView = UIView.createViewForTF()
        customTF.rightViewMode = .always
        
        let eyeButton = UIButton.createEyeButton()
        eyeButton.addTarget(
            self,
            action: #selector(toggleTextVisibility),
            for: .touchUpInside
        )
        eyeButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        customTF.rightView?.addSubview(eyeButton)
        
        return customTF
    }
}
