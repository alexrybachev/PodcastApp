//
//  CreateAccauntView.swift
//  PodcastApp
//
//  Created by Kirill Taraturin on 25.09.2023.
//

import UIKit

final class CreateAccauntView: UIView {
    
    // MARK: - UI Properties
    private lazy var mainView: UIView = {
        var mainView = UIView()
        mainView.backgroundColor = .white
        mainView.layer.cornerRadius = 30
        return mainView
    }()
    
    private lazy var welcomeLabel: UILabel = {
        var welcomeLabel = UILabel()
        welcomeLabel.text = "Create account"
        welcomeLabel.textColor = .white
        welcomeLabel.font = UIFont.boldSystemFont(ofSize: 24)
        return welcomeLabel
    }()
    
    private lazy var emailLabel: UILabel = {
        var emailLabel = UILabel()
        emailLabel.text = "Email"
        emailLabel.textColor = #colorLiteral(red: 0.4713656902, green: 0.5105890036, blue: 0.5429269075, alpha: 1)
        return emailLabel
    }()
    
    lazy var emailTextField: UITextField = {
        let customTF = UITextField()
        customTF.layer.cornerRadius = 20
        customTF.backgroundColor = #colorLiteral(red: 0.964484036, green: 0.9729270339, blue: 0.9972267747, alpha: 1)
        customTF.isSecureTextEntry = false
        
        // устанавливаем цвет текста в placeholder
        let placeholderText = NSAttributedString(
            string: "Enter you email address",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
        customTF.attributedPlaceholder = placeholderText
        
        // создаем отступ от левого края textField
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 40))
        customTF.leftView = leftView
        customTF.leftViewMode = .always
        
        return customTF
    }()
    
    lazy var continueButton: UIButton = {
        var contButton = UIButton(type: .system)
            .createDefaultButton(text: "Continue with Email", cornerRadius: 25)
        return contButton
    }()
    
    lazy var googleButton: UIButton = {
        var googleButton = UIButton().createGoogleButton()
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
    
    private lazy var continueLabel: UILabel = {
        var contLabel = UILabel()
        contLabel.text = "Or continue with"
        contLabel.textColor = #colorLiteral(red: 0.4863581657, green: 0.4862256646, blue: 0.4821705818, alpha: 1)
        return contLabel
    }()
    
    private lazy var leftLineView: UIView = {
        var leftView = UIView()
        leftView.backgroundColor = #colorLiteral(red: 0.4235294461, green: 0.4235294461, blue: 0.4235294461, alpha: 1)
        return leftView
    }()
    
    private lazy var rightLineView: UIView = {
        var rightView = UIView()
        rightView.backgroundColor = #colorLiteral(red: 0.4235294461, green: 0.4235294461, blue: 0.4235294461, alpha: 1)
        return rightView
    }()
    
    private lazy var accountView: UIView = {
        var accountView = UIView()
        return accountView
    }()
    
    private lazy var signInStatusLabel: UILabel = {
        var signInStatusLabel = UILabel()
        signInStatusLabel.text = "Already have an account?"
        signInStatusLabel.textColor = #colorLiteral(red: 0.4235294461, green: 0.4235294461, blue: 0.4235294461, alpha: 1)
        signInStatusLabel.font = UIFont.systemFont(ofSize: 16)
        return signInStatusLabel
    }()
    
    private lazy var loginButton: UIButton = {
        var registerButton = UIButton(type: .system)
        registerButton.setTitle("Login", for: .normal)
        registerButton.tintColor = #colorLiteral(red: 0.3171662092, green: 0.3071304858, blue: 0.7139448524, alpha: 1)
        registerButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        return registerButton
    }()
    
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = #colorLiteral(red: 0.1545267403, green: 0.5085523725, blue: 0.9443916678, alpha: 1)
        addViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Actions
    // методы для нажатия на кнопку googleButton
    @objc func buttonPressed() {
        UIView.animate(withDuration: 0.1, animations: {
            self.googleButton.alpha = 1.0 // Уменьшаем прозрачность при нажатии
        })
    }
    
    @objc func buttonReleased() {
        UIView.animate(withDuration: 0.1, animations: {
            self.googleButton.alpha = 0.5 // Устанавливаем обратно исходную прозрачность при отпускании
        })
    }
    
    // MARK: - Private Methods
    private func addViews() {
        self.addSubview(mainView)
        self.addSubview(welcomeLabel)
        mainView.addSubview(emailLabel)
        mainView.addSubview(emailTextField)
        mainView.addSubview(continueButton)
        mainView.addSubview(googleButton)
        mainView.addSubview(continueLabel)
        mainView.addSubview(leftLineView)
        mainView.addSubview(rightLineView)
        mainView.addSubview(accountView)
        
        accountView.addSubview(signInStatusLabel)
        accountView.addSubview(loginButton)
    }
    
    private func setupConstraints() {
        mainView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(200)
            make.bottom.equalToSuperview().offset(25)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        welcomeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.centerX.equalToSuperview()
        }
        
        emailLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(47)
            make.left.equalToSuperview().offset(24)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-24)
            make.height.equalTo(60)
        }
        
        continueButton.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(32)
            make.left.equalToSuperview().offset(25)
            make.right.equalToSuperview().offset(-25)
            make.height.equalTo(56)
        }
        
        continueLabel.snp.makeConstraints { make in
            make.top.equalTo(continueButton.snp.bottom).offset(38)
            make.centerX.equalToSuperview()
        }
        
        leftLineView.snp.makeConstraints { make in
            make.right.equalTo(continueLabel.snp.left).offset(-10)
            make.top.equalTo(continueLabel.snp.top).offset(8)
            make.height.equalTo(1.3)
            make.width.equalTo(62)
        }
        
        rightLineView.snp.makeConstraints { make in
            make.left.equalTo(continueLabel.snp.right).offset(10)
            make.top.equalTo(continueLabel.snp.top).offset(8)
            make.height.equalTo(1.3)
            make.width.equalTo(62)
        }
        
        googleButton.snp.makeConstraints { make in
            make.top.equalTo(continueLabel.snp.bottom).offset(38)
            make.left.equalToSuperview().offset(25)
            make.right.equalToSuperview().offset(-25)
            make.height.equalTo(56)
        }
        
        accountView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-50)
            make.height.equalTo(20)
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
}
