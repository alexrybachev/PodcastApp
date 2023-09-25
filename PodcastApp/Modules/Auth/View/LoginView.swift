//
//  LoginView.swift
//  PodcastApp
//
//  Created by Kirill Taraturin on 25.09.2023.
//

import UIKit

final class LoginView: UIView {
    
    // MARK: - Login Properties
    private lazy var loginPropertieView: UIView = {
        var loginPropertieView = UIView()
        return loginPropertieView
    }()
    
    private lazy var loginLabel: UILabel = {
        var loginLabel = setupCustomLabel(text: "Enter Login", fontSize: 16)
        return loginLabel
    }()
    
    lazy var loginTextField: UITextField = {
        var loginTF = setupCustomTextField(with: "Login")
        loginTF.rightView = rightViewForLoginTF
        loginTF.rightViewMode = .always
        return loginTF
    }()
    
    private lazy var rightViewForLoginTF: UIView = {
        var rightViewForTF = UIView()
        rightViewForTF.frame = CGRect(x: 0, y: 0, width: 50, height: 40)
        return rightViewForTF
    }()
    
    private lazy var eyeLoginButton: UIButton = {
        var eyeLoginButton = createEyeButton()
        return eyeLoginButton
    }()
    
    // MARK: - Password Properties
    private lazy var passwordPropertieView: UIView = {
        var passwordPropView = UIView()
        return passwordPropView
    }()
    
    private lazy var passwordLabel: UILabel = {
        var passwordLabel = setupCustomLabel(text: "Password", fontSize: 16)
        return passwordLabel
    }()
    
    lazy var passwordTextField: UITextField = {
        var passwordTF = setupCustomTextField(with: "Password")
        passwordTF.rightView = rightViewForPassworTF
        passwordTF.rightViewMode = .always
        return passwordTF
    }()
    
    private lazy var rightViewForPassworTF: UIView = {
        var rightViewForTF = UIView()
        
        rightViewForTF.frame = CGRect(x: 0, y: 0, width: 50, height: 40)
        return rightViewForTF
    }()
    
    private lazy var eyePasswordButton: UIButton = {
        var eyePassButton = createEyeButton()
        return eyePassButton
    }()
    
    // MARK: - Button Properties
    private lazy var loginButton: UIButton = {
        var logButton = UIButton(type: .system)
            .createDefaultButton(text: "Log In", cornerRadius: 24)
        return logButton
    }()
    
    private lazy var googleButton: UIButton = {
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
    
    private lazy var registerButton: UIButton = {
        var registerButton = UIButton(type: .system)
        registerButton.setTitle("Register", for: .normal)
        registerButton.tintColor = #colorLiteral(red: 0.7093204856, green: 0.7974258065, blue: 0.3607985973, alpha: 1)
        registerButton.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        return registerButton
    }()
    
    // MARK: - Other Properties
    private lazy var continueLabel: UILabel = {
        var contLabel = setupCustomLabel(text: "Or continue with", fontSize: 14)
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
    
    private lazy var noAccauntLabel: UILabel = {
        var accLabel = setupCustomLabel(
            text: "Don't have an account yet?",
            fontSize: 13
        )
        return accLabel
    }()
    
    private lazy var registerView: UIView = {
        var registerView = UIView()
        return registerView
    }()
    
    // MARK: -  Init
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
    @objc func toggleTextVisibility(_ sender: UIButton) {
        if let textField = sender.superview?.superview as? UITextField {
            textField.isSecureTextEntry.toggle()
            let image = textField.isSecureTextEntry
            ? UIImage(systemName: "eye.slash.fill")
            : UIImage(systemName: "eye.fill")
            sender.setImage(image, for: .normal)
        }
    }
    
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
        self.addSubview(loginPropertieView)
        self.addSubview(passwordPropertieView)
        self.addSubview(loginButton)
        self.addSubview(continueLabel)
        self.addSubview(leftLineView)
        self.addSubview(rightLineView)
        self.addSubview(googleButton)
        self.addSubview(registerView)
        
        registerView.addSubview(noAccauntLabel)
        registerView.addSubview(registerButton)
        
        loginPropertieView.addSubview(loginLabel)
        loginPropertieView.addSubview(loginTextField)
        
        passwordPropertieView.addSubview(passwordLabel)
        passwordPropertieView.addSubview(passwordTextField)
        
        rightViewForLoginTF.addSubview(eyeLoginButton)
        rightViewForPassworTF.addSubview(eyePasswordButton)
    }
    
    private func setupConstraints() {
        loginPropertieView.snp.makeConstraints { make in
            make.height.equalTo(70)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.top.equalToSuperview().offset(120)
        }
        
        passwordPropertieView.snp.makeConstraints { make in
            make.height.equalTo(70)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.top.equalTo(loginPropertieView.snp.bottom).offset(12)
        }
        
        loginLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
        }
        
        loginTextField.snp.makeConstraints { make in
            make.top.equalTo(loginLabel.snp.bottom).offset(5)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        passwordLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom).offset(5)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordPropertieView.snp.bottom).offset(24)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(57)
        }
        
        continueLabel.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
        }
        
        leftLineView.snp.makeConstraints { make in
            make.right.equalTo(continueLabel.snp.left).offset(-10)
            make.top.equalTo(continueLabel.snp.top).offset(7)
            make.height.equalTo(1.3)
            make.width.equalTo(62)
        }
        
        rightLineView.snp.makeConstraints { make in
            make.left.equalTo(continueLabel.snp.right).offset(10)
            make.top.equalTo(continueLabel.snp.top).offset(7)
            make.height.equalTo(1.3)
            make.width.equalTo(62)
        }
        
        googleButton.snp.makeConstraints { make in
            make.top.equalTo(continueLabel.snp.bottom).offset(60)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-24)
            make.height.equalTo(56)
        }
        
        registerView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-50)
            make.height.equalTo(20)
            make.width.equalTo(220)
        }
        
        noAccauntLabel.snp.makeConstraints { make in
            make.left.equalToSuperview()
        }
        
        registerButton.snp.makeConstraints { make in
            make.left.equalTo(noAccauntLabel.snp.right).offset(2)
            make.height.equalTo(noAccauntLabel.snp.height)
        }
    }
    
    // MARK: - Create UI Methods
    private func setupCustomLabel(text: String, fontSize: Int) -> UILabel {
        let customLabel = UILabel()
        customLabel.text = text
        customLabel.textColor = #colorLiteral(red: 0.4863581657, green: 0.4862256646, blue: 0.4821705818, alpha: 1)
        customLabel.font = UIFont.systemFont(ofSize: CGFloat(fontSize))
        return customLabel
    }
    
    private func setupCustomTextField(with placeholder: String) -> UITextField {
        let customTF = UITextField().createCustomTextField(placeholder: placeholder)
        customTF.layer.cornerRadius = 13
        customTF.layer.borderColor = UIColor.systemGray5.cgColor
        customTF.layer.borderWidth = 1
        customTF.backgroundColor = #colorLiteral(red: 0.984313786, green: 0.984313786, blue: 0.9843136668, alpha: 1)
        customTF.isSecureTextEntry = false
        return customTF
    }
    
    private func createEyeButton() -> UIButton {
        let bustomEyeButton = UIButton(type: .custom)
        bustomEyeButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        bustomEyeButton.frame = CGRect(x: 10, y: 10, width: 23, height: 20)
        bustomEyeButton.tintColor = #colorLiteral(red: 0.6980392337, green: 0.6980391741, blue: 0.6980391741, alpha: 1)
        bustomEyeButton.addTarget(
            self,
            action: #selector(toggleTextVisibility),
            for: .touchUpInside
        )
        return bustomEyeButton
    }
}
