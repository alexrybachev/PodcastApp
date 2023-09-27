//
//  RegistrationViewController.swift
//  PodcastApp
//
//  Created by Kirill Taraturin on 26.09.2023.
//

import UIKit

final class RegistrationViewController: UIViewController {
    
    // MARK: - Private UI Properties
    private let welcomeLabel = CustomLabel(
        title: "Complete your account",
        font: UIFont.boldSystemFont(ofSize: 24),
        color: .black
    )
    
    // MARK: - FirstName Properties
    private let firstNameLabel = CustomLabel(
        title: "First Name",
        color: #colorLiteral(red: 0.4713656902, green: 0.5105890036, blue: 0.5429269075, alpha: 1)
    )
    
    private let firstNameField = CustomTextField(
        fieldType: .withoutEyeButton,
        placeholder: "Enter you first name",
        border: false
    )
    
    private lazy var firstNameStackView: UIStackView  = {
        var firstNameSV = UIStackView(
            arrangedSubviews: [firstNameLabel, firstNameField]
        )
        firstNameSV.axis = .vertical
        firstNameSV.spacing = 10
        return firstNameSV
    }()
    
    // MARK: - LastName Properties
    private let lastNameLabel = CustomLabel(
        title: "Last Name",
        color: #colorLiteral(red: 0.4713656902, green: 0.5105890036, blue: 0.5429269075, alpha: 1)
    )
    
    private let lastNameField = CustomTextField(
        fieldType: .withoutEyeButton,
        placeholder: "Enter you last name",
        border: false
    )
    
    private lazy var lastNameStackView: UIStackView  = {
        var lastNameSV = UIStackView(
            arrangedSubviews: [lastNameLabel, lastNameField]
        )
        lastNameSV.axis = .vertical
        lastNameSV.spacing = 10
        
        return lastNameSV
    }()
    
    // MARK: - Email Properties
    private let emailLabel = CustomLabel(
        title: "E-mail",
        color: #colorLiteral(red: 0.4713656902, green: 0.5105890036, blue: 0.5429269075, alpha: 1)
    )
    
    private let emailField = CustomTextField(
        fieldType: .withoutEyeButton,
        placeholder: "Enter you email",
        border: false
    )
    
    private lazy var emailStackView: UIStackView  = {
        var emailSV = UIStackView(
            arrangedSubviews: [emailLabel, emailField]
        )
        emailSV.axis = .vertical
        emailSV.spacing = 10
        
        return emailSV
    }()
    
    // MARK: - Password Properties
    private let passwordLabel = CustomLabel(
        title: "Password",
        color: #colorLiteral(red: 0.4713656902, green: 0.5105890036, blue: 0.5429269075, alpha: 1)
    )
    
    private lazy var passwordField: CustomTextField = {
        var passField = CustomTextField(
            fieldType: .withEyeButton,
            placeholder: "Enter you password",
            border: false
        )
        passField.layer.cornerRadius = 25
        return passField
    }()
    
    private lazy var passwordStackView: UIStackView  = {
        var passwordSV = UIStackView(
            arrangedSubviews: [passwordLabel, passwordField]
        )
        passwordSV.axis = .vertical
        passwordSV.spacing = 10
        return passwordSV
    }()
    
    // MARK: - ConfirmPassword Properties
    private let confirmPasswordLabel = CustomLabel(
        title: "Confirm Password",
        color: #colorLiteral(red: 0.4713656902, green: 0.5105890036, blue: 0.5429269075, alpha: 1)
    )
    
    private lazy var confirmPasswordField: CustomTextField = {
        var passField = CustomTextField(
            fieldType: .withEyeButton,
            placeholder: "Enter you password",
            border: false
        )
        passField.layer.cornerRadius = 25
        return passField
    }()
    
    private lazy var confirmPasswordStackView: UIStackView  = {
        var passSV = UIStackView(
            arrangedSubviews: [confirmPasswordLabel, confirmPasswordField]
        )
        passSV.axis = .vertical
        passSV.spacing = 10
        
        return passSV
    }()
    
    private let signUpButton = CustomButton(
        title: "Sign Up",
        buttonType: .blueButton
    )
    
    private lazy var loginStackView: AuthStackView = {
        var loginSV = AuthStackView(authType: .login)
        loginSV.actionButton.setTitleColor(#colorLiteral(red: 0.3171662092, green: 0.3071304858, blue: 0.7139448524, alpha: 1), for: .normal
        )
        return loginSV
    }()
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sign Up"
        view.backgroundColor = .white
        addViews()
        setupConstraints()
    }
    
    // MARK: - Private methods
    private func addViews() {
        view.addSubview(welcomeLabel)
        view.addSubview(firstNameStackView)
        view.addSubview(lastNameStackView)
        view.addSubview(emailStackView)
        view.addSubview(passwordStackView)
        view.addSubview(confirmPasswordStackView)
        view.addSubview(signUpButton)
        view.addSubview(loginStackView)
    }
    
    private func setupConstraints() {
        welcomeLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.centerX.equalToSuperview()
            
        }
        
        firstNameStackView.snp.makeConstraints { make in
            make.top.equalTo(welcomeLabel.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-24)
        }
        
        lastNameStackView.snp.makeConstraints { make in
            make.top.equalTo(firstNameStackView.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-24)
        }
        
        emailStackView.snp.makeConstraints { make in
            make.top.equalTo(lastNameStackView.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-24)
        }
        
        passwordStackView.snp.makeConstraints { make in
            make.top.equalTo(emailStackView.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-24)
        }
        
        confirmPasswordStackView.snp.makeConstraints { make in
            make.top.equalTo(passwordStackView.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-24)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(confirmPasswordStackView.snp.bottom).offset(18)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-24)
            make.height.equalTo(56)
        }
        
        loginStackView.snp.makeConstraints { make in
            make.top.equalTo(signUpButton.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-30)
        }
        
        firstNameField.snp.makeConstraints { make in
            make.height.equalTo(45)
        }
        
        lastNameField.snp.makeConstraints { make in
            make.height.equalTo(45)
        }
        
        emailField.snp.makeConstraints { make in
            make.height.equalTo(45)
        }
        
        passwordField.snp.makeConstraints { make in
            make.height.equalTo(45)
        }
        
        confirmPasswordField.snp.makeConstraints { make in
            make.height.equalTo(45)
        }
    }
}

