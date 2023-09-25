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
    
    lazy var loginLabel: UILabel = {
        var loginLabel = setupCustomLabel(with: "Enter Login")
        return loginLabel
    }()
    
    lazy var loginTextField: UITextField = {
        var loginTF = setupCustomTextField(with: "Login")
        return loginTF
    }()
    
    lazy var rightViewForLoginTF: UIView = {
        var rightViewForTF = UIView()
        
        rightViewForTF.frame = CGRect(x: 0, y: 0, width: 50, height: 40)
        return rightViewForTF
    }()
    
    lazy var eyeLoginButton: UIButton = {
        var eyeLoginButton = createEyeButton()
        return eyeLoginButton
    }()
    
    // MARK: - Password Properties
    private lazy var passwordPropertieView: UIView = {
        var passwordPropView = UIView()
        return passwordPropView
    }()
    
    lazy var passwordLabel: UILabel = {
        var passwordLabel = setupCustomLabel(with: "Password")
        return passwordLabel
    }()
    
    lazy var passwordTextField: UITextField = {
        var passwordTF = setupCustomTextField(with: "Password")
        return passwordTF
    }()
    
    lazy var rightViewForPassworTF: UIView = {
        var rightViewForTF = UIView()
        
        rightViewForTF.frame = CGRect(x: 0, y: 0, width: 50, height: 40)
        return rightViewForTF
    }()
    
    lazy var eyePasswordButton: UIButton = {
        var eyePassButton = createEyeButton()
        return eyePassButton
    }()
    
    // MARK: - Button Properties
    lazy var loginButton: UIButton = {
        var logButton = UIButton(type: .system)
        logButton.setTitle("Log In", for: .normal)
        logButton.backgroundColor = #colorLiteral(red: 0.1589552164, green: 0.5085405111, blue: 0.9443863034, alpha: 1)
        logButton.layer.cornerRadius = 30
        logButton.tintColor = .white
        logButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        return logButton
    }()
    
    // MARK: - Other Properties
    lazy var continueLabel: UILabel = {
        var contLabel = UILabel()
        contLabel.text = "Or continue with"
        contLabel.textColor = #colorLiteral(red: 0.4235294461, green: 0.4235294461, blue: 0.4235294461, alpha: 1)
        contLabel.font = UIFont.systemFont(ofSize: 14)
        return contLabel
    }()
    
    lazy var leftLineView: UIView = {
        var leftView = UIView()
        leftView.backgroundColor = #colorLiteral(red: 0.4235294461, green: 0.4235294461, blue: 0.4235294461, alpha: 1)
        return leftView
    }()
    
    lazy var rightLineView: UIView = {
        var rightView = UIView()
        rightView.backgroundColor = #colorLiteral(red: 0.4235294461, green: 0.4235294461, blue: 0.4235294461, alpha: 1)
        return rightView
    }()
    
    // MARK: -  Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        addViews()
        
        loginTextField.rightView = rightViewForLoginTF
        loginTextField.rightViewMode = .always
        
        passwordTextField.rightView = rightViewForPassworTF
        passwordTextField.rightViewMode = .always
        
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
    
    // MARK: - Private Methods
    private func addViews() {
        self.addSubview(loginPropertieView)
        self.addSubview(passwordPropertieView)
        self.addSubview(loginButton)
        self.addSubview(continueLabel)
        self.addSubview(leftLineView)
        self.addSubview(rightLineView)
        
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
            make.top.equalToSuperview().offset(140)
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
            make.top.equalTo(loginButton.snp.bottom).offset(45)
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
    }
    
    // MARK: - Create UI Methods
    private func setupCustomLabel(with text: String) -> UILabel {
        let customLabel = UILabel()
        customLabel.text = text
        customLabel.textColor = #colorLiteral(red: 0.4863581657, green: 0.4862256646, blue: 0.4821705818, alpha: 1)
        customLabel.font = UIFont.systemFont(ofSize: 16)
        return customLabel
    }
    
    private func setupCustomTextField(with placeholder: String) -> UITextField {
        let customTF = UITextField()
        customTF.layer.cornerRadius = 13
        customTF.layer.borderColor = UIColor.systemGray5.cgColor
        customTF.layer.borderWidth = 1
        customTF.backgroundColor = #colorLiteral(red: 0.984313786, green: 0.984313786, blue: 0.9843136668, alpha: 1)
        customTF.isSecureTextEntry = false
        
        // устанавливаем цвет текста в placeholder
        let placeholderText = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
        customTF.attributedPlaceholder = placeholderText
        
        // создаем отступ от левого края textField
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 40))
        customTF.leftView = leftView
        customTF.leftViewMode = .always
        
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
