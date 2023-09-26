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
            text: "Enter your email",
            fontSize: UIFont.systemFont(ofSize: 14)
        )
        return emailLabel
    }()
    
    private lazy var passwordLabel: UILabel = {
        var passwordLabel = UILabel.setupCustomLabel(
            text: "Enter your password",
            fontSize: UIFont.systemFont(ofSize: 14)
        )
        return passwordLabel
    }()
    
    private lazy var confirmPasswordLabel: UILabel = {
        var confirmPasswordLabel = UILabel.setupCustomLabel(
            text: "Enter your password",
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
        return passwordTF
    }()
    
    private lazy var confirmPasswordTextField: UITextField = {
        var confirmPasswordTF = UITextField.createCustomTextField(
            placeholder: "Enter your password"
        )
        setupTextField(confirmPasswordTF)
        return confirmPasswordTF
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
    }
    
    private func setupConstraints() {
        welcomeLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(35)
            make.centerX.equalToSuperview()
        }
        
        firstNameLabel.snp.makeConstraints { make in
            make.top.equalTo(welcomeLabel.snp.bottom).offset(62)
            make.left.equalToSuperview().offset(24)
        }
        
        firstNameTextField.snp.makeConstraints { make in
            make.top.equalTo(firstNameLabel.snp.bottom).offset(7)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-24)
            make.height.equalTo(52)
        }
        
        lastNameLabel.snp.makeConstraints { make in
            make.top.equalTo(firstNameTextField.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(24)
        }
        
        lastNameTextField.snp.makeConstraints { make in
            make.top.equalTo(lastNameLabel.snp.bottom).offset(7)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-24)
            make.height.equalTo(52)
        }
        
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(lastNameTextField.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(24)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(7)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-24)
            make.height.equalTo(52)
        }
        
        passwordLabel.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(24)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom).offset(7)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-24)
            make.height.equalTo(52)
        }
        
        confirmPasswordLabel.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(24)
        }
        
        confirmPasswordTextField.snp.makeConstraints { make in
            make.top.equalTo(confirmPasswordLabel.snp.bottom).offset(7)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-24)
            make.height.equalTo(52)
        }
    }
    
    private func setupTextField(_ textField: UITextField) {
        textField.layer.cornerRadius = 20
        textField.backgroundColor = #colorLiteral(red: 0.964484036, green: 0.9729270339, blue: 0.9972267747, alpha: 1)
    }
}
