//
//  LoginView.swift
//  PodcastApp
//
//  Created by Kirill Taraturin on 25.09.2023.
//

import UIKit

final class LoginView: UIView {
    
    // MARK: - Login Properties
    private lazy var loginLabel: UILabel = {
        var loginLabel = UILabel.setupCustomLabel(
            text: "Enter Login",
            fontSize: UIFont.systemFont(ofSize: 14)
        )
        return loginLabel
    }()
    
    lazy var loginTextField: UITextField = {
        var loginTF = setupCustomTextField(with: "Login")
        return loginTF
    }()
    
    // MARK: - Password Properties
    private lazy var passwordLabel: UILabel = {
        var passwordLabel = UILabel.setupCustomLabel(
            text: "Password",
            fontSize: UIFont.systemFont(ofSize: 14)
        )
        return passwordLabel
    }()
    
    lazy var passwordTextField: UITextField = {
        var paswordTF = setupCustomTextField(with: "Password")
        return paswordTF
    }()
    
    // MARK: - Button Properties
    private lazy var loginButton: UIButton = {
        var logButton = UIButton.createDefaultButton(text: "Log In", cornerRadius: 27)
        return logButton
    }()
    
    private lazy var googleButton: UIButton = {
        var googleButton = UIButton.createGoogleButton()
        
        googleButton.addTarget(
            self,
            action: #selector(buttonPressed),
            for: .touchUpInside
        )
        
        googleButton.addTarget(
            self,
            action: #selector(buttonReleased),
            for: .touchDown
        )
        return googleButton
    }()
    
    // MARK: - Other Properties
    private lazy var continueView: UIView = {
        var contView = UIView.createCustomView()
        return contView
    }()
    
    private lazy var registerStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 1
        stackView.alignment = .fill
        stackView.distribution = .fill
        
        var accountStatusLabel = UILabel.setupCustomLabel(
            text: "Don't have an account yet?",
            fontSize: UIFont.systemFont(ofSize: 13)
        )
        
        var registerButton = UIButton(type: .system)
        registerButton.setTitle("Register", for: .normal)
        registerButton.tintColor = #colorLiteral(red: 0.7093204856, green: 0.7974258065, blue: 0.3607985973, alpha: 1)
        registerButton.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        
        stackView.addArrangedSubview(accountStatusLabel)
        stackView.addArrangedSubview(registerButton)
        
        return stackView
    }()
    
    // MARK: -  Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        addSubviews(loginLabel,
                    loginTextField,
                    passwordLabel,
                    passwordTextField,
                    loginButton,
                    continueView,
                    googleButton,
                    registerStackView
        )
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Actions
    // метод для скрытия текста в момент печати
    @objc private func toggleTextVisibility(_ sender: UIButton) {
        if let textField = sender.superview?.superview as? UITextField {
            textField.isSecureTextEntry.toggle()
            
            let image = textField.isSecureTextEntry
            ? UIImage(systemName: "eye.slash.fill")
            : UIImage(systemName: "eye.fill")
            
            sender.setImage(image, for: .normal)
        }
    }
    
    // методы для эффекта нажатия на кнопку googleButton
    @objc private func buttonPressed() {
        UIView.animate(withDuration: 0.1, animations: {
            // Уменьшаем прозрачность при нажатии
            self.googleButton.alpha = 1.0
        })
    }
    
    @objc private func buttonReleased() {
        UIView.animate(withDuration: 0.1, animations: {
            // Устанавливаем обратно исходную прозрачность при отпускании
            self.googleButton.alpha = 0.5
        })
    }
    
    // MARK: - Private Methods
    private func addSubviews(_ views: UIView...) {
        views.forEach { subview in
            self.addSubview(subview)
        }
    }
    
    private func setupConstraints() {
        
        loginLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(120)
            make.left.equalToSuperview().offset(16)
        }
        
        loginTextField.snp.makeConstraints { make in
            make.top.equalTo(loginLabel.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(45)
        }
        
        passwordLabel.snp.makeConstraints { make in
            make.top.equalTo(loginTextField.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(16)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(45)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(24)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(56)
        }
        
        continueView.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(45)
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
        }
        
        googleButton.snp.makeConstraints { make in
            make.top.equalTo(continueView.snp.bottom).offset(65)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-24)
            make.height.equalTo(56)
        }
        
        registerStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-50)
            make.height.equalTo(20)
            make.width.equalTo(220)
        }
    }
    
    // MARK: - Create UI Methods
    // метод для создания textField
    private func setupCustomTextField(with placeholder: String) -> UITextField {
        let customTF = UITextField
            .createCustomTextField(placeholder: placeholder)
        customTF.layer.cornerRadius = 13
        customTF.layer.borderColor = UIColor.systemGray5.cgColor
        customTF.layer.borderWidth = 1
        customTF.backgroundColor = #colorLiteral(red: 0.984313786, green: 0.984313786, blue: 0.9843136668, alpha: 1)
        customTF.isSecureTextEntry = false
        
        customTF.rightView = UIView.createViewForTF()
        customTF.rightViewMode = .always
        
        let eyeButton = UIButton.createEyeButton()
        eyeButton.addTarget(
            self,
            action: #selector(toggleTextVisibility),
            for: .touchUpInside
        )
        
        customTF.rightView?.addSubview(eyeButton)
        
        return customTF
    }
}
