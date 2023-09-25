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
            make.top.equalTo(loginPropertieView.snp.bottom).offset(10)
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
        var customTF = UITextField()
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
