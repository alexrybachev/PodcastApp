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
        var passwordTF = UITextField.createCustomTextField(
            placeholder: "Enter your password"
        )
        setupTextField(passwordTF)
        passwordTF.isSecureTextEntry = true
        passwordTF.rightView = UIView.createViewForTF()
        passwordTF.rightViewMode = .always
        
        let eyeButton = UIButton.createEyeButton()
        eyeButton.addTarget(
            self,
            action: #selector(toggleTextVisibility),
            for: .touchUpInside
        )
        eyeButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        passwordTF.rightView?.addSubview(eyeButton)
        return passwordTF
    }()
    
    private lazy var confirmPasswordTextField: UITextField = {
        var confirmPasswordTF = UITextField.createCustomTextField(
            placeholder: "Enter your password"
        )
        setupTextField(confirmPasswordTF)
        confirmPasswordTF.isSecureTextEntry = true
        confirmPasswordTF.rightView = UIView.createViewForTF()
        confirmPasswordTF.rightViewMode = .always
        
        let eyeButton = UIButton.createEyeButton()
        eyeButton.addTarget(
            self,
            action: #selector(toggleTextVisibility),
            for: .touchUpInside
        )
        eyeButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        
        confirmPasswordTF.rightView?.addSubview(eyeButton)
        return confirmPasswordTF
    }()
    
    // MARK: - UI Properties (Buttons)
    private lazy var signUpButton: UIButton = {
        var signUpButton = UIButton().createDefaultButton(
            text: "Sign Up",
            cornerRadius: 24
        )
        return signUpButton
    }()
    
    // MARK: - Other UI Properties
    private lazy var accountView: UIView = {
        var accountView = UIView()
        accountView.addSubview(signInStatusLabel)
        accountView.addSubview(loginButton)
        return accountView
    }()
    
    private lazy var signInStatusLabel: UILabel = {
        var signInStatusLabel = UILabel.setupCustomLabel(
            text: "Already have an account?",
            fontSize: UIFont.systemFont(ofSize: 16)
        )
        signInStatusLabel.textColor = #colorLiteral(red: 0.4235294461, green: 0.4235294461, blue: 0.4235294461, alpha: 1)
        return signInStatusLabel
    }()
    
    private lazy var loginButton: UIButton = {
        var registerButton = UIButton.createPurpleLoginButton()
        return registerButton
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        addViews()
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
    private func addViews() {
        self.addSubview(welcomeLabel)
        self.addSubview(firstNameLabel)
        self.addSubview(firstNameTextField)
        self.addSubview(lastNameLabel)
        self.addSubview(lastNameTextField)
        self.addSubview(emailLabel)
        self.addSubview(emailTextField)
        self.addSubview(passwordLabel)
        self.addSubview(passwordTextField)
        self.addSubview(confirmPasswordLabel)
        self.addSubview(confirmPasswordTextField)
        self.addSubview(signUpButton)
        self.addSubview(signInStatusLabel)
        self.addSubview(loginButton)
        self.addSubview(accountView)
    }
    
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

        accountView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
//            make.top.equalTo(signUpButton.snp.bottom).offset(40)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-50)
//            make.height.equalTo(20)
            make.width.equalTo(220)
        }

        signInStatusLabel.snp.makeConstraints { make in
            make.left.equalToSuperview()
        }

        loginButton.snp.makeConstraints { make in
            make.left.equalTo(signInStatusLabel.snp.right).offset(2)
            make.height.equalTo(signInStatusLabel.snp.height)
        }
    }

    
//    private func setupConstraints() {
//        welcomeLabel.snp.makeConstraints { make in
//            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(25)
//            make.centerX.equalToSuperview()
//            make.height.equalTo(24)
//        }
//
//        firstNameLabel.snp.makeConstraints { make in
//            make.top.equalTo(welcomeLabel.snp.bottom).offset(25)
//            make.left.equalToSuperview().offset(24)
//            make.height.equalTo(14)
//        }
//
//        firstNameTextField.snp.makeConstraints { make in
//            make.top.equalTo(firstNameLabel.snp.bottom).offset(7)
//            make.left.equalToSuperview().offset(24)
//            make.right.equalToSuperview().offset(-24)
//            make.height.equalTo(52)
//        }
//
//        lastNameLabel.snp.makeConstraints { make in
//            make.top.equalTo(firstNameTextField.snp.bottom).offset(10)
//            make.left.equalToSuperview().offset(24)
//            make.height.equalTo(14)
//        }
//
//        lastNameTextField.snp.makeConstraints { make in
//            make.top.equalTo(lastNameLabel.snp.bottom).offset(7)
//            make.left.equalToSuperview().offset(24)
//            make.right.equalToSuperview().offset(-24)
//            make.height.equalTo(52)
//        }
//
//        emailLabel.snp.makeConstraints { make in
//            make.top.equalTo(lastNameTextField.snp.bottom).offset(10)
//            make.left.equalToSuperview().offset(24)
//            make.height.equalTo(14)
//        }
//
//        emailTextField.snp.makeConstraints { make in
//            make.top.equalTo(emailLabel.snp.bottom).offset(7)
//            make.left.equalToSuperview().offset(24)
//            make.right.equalToSuperview().offset(-24)
//            make.height.equalTo(52)
//        }
//
//        passwordLabel.snp.makeConstraints { make in
//            make.top.equalTo(emailTextField.snp.bottom).offset(10)
//            make.left.equalToSuperview().offset(24)
//            make.height.equalTo(14)
//        }
//
//        passwordTextField.snp.makeConstraints { make in
//            make.top.equalTo(passwordLabel.snp.bottom).offset(7)
//            make.left.equalToSuperview().offset(24)
//            make.right.equalToSuperview().offset(-24)
//            make.height.equalTo(52)
//        }
//
//        confirmPasswordLabel.snp.makeConstraints { make in
//            make.top.equalTo(passwordTextField.snp.bottom).offset(10)
//            make.left.equalToSuperview().offset(24)
//            make.height.equalTo(14)
//        }
//
//        confirmPasswordTextField.snp.makeConstraints { make in
//            make.top.equalTo(confirmPasswordLabel.snp.bottom).offset(7)
//            make.left.equalToSuperview().offset(24)
//            make.right.equalToSuperview().offset(-24)
//            make.height.equalTo(52)
//        }
//
//        signUpButton.snp.makeConstraints { make in
////            make.top.equalTo(confirmPasswordTextField.snp.bottom).offset(24)
//            make.left.equalToSuperview().offset(24)
//            make.right.equalToSuperview().offset(-24)
//            make.height.equalTo(56)
//        }
//
//        accountView.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.top.equalTo(signUpButton.snp.bottom).offset(20)
//            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-20)
//            make.height.equalTo(20)
//            make.width.equalTo(220)
//        }
//
//        signInStatusLabel.snp.makeConstraints { make in
//            make.left.equalToSuperview()
//            
//        }
//
//        loginButton.snp.makeConstraints { make in
//            make.left.equalTo(signInStatusLabel.snp.right).offset(2)
//            make.height.equalTo(signInStatusLabel.snp.height)
//        }
//    }
    
    private func setupTextField(_ textField: UITextField) {
        textField.layer.cornerRadius = 20
        textField.backgroundColor = #colorLiteral(red: 0.964484036, green: 0.9729270339, blue: 0.9972267747, alpha: 1)
    }
}
