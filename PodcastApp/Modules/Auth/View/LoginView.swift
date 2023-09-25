//
//  LoginView.swift
//  PodcastApp
//
//  Created by Kirill Taraturin on 25.09.2023.
//

import UIKit

final class LoginView: UIView {
    
    // MARK: - Login Properties
    private lazy var loginContrainterView: UIView = {
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
        var rightViewForTF = createRightViewForTF()
        return rightViewForTF
    }()
    
    // MARK: - Password Properties
    private lazy var passwordContrainterView: UIView = {
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
        var rightViewForTF = createRightViewForTF()
        return rightViewForTF
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
    private lazy var continueView: UIView = {
        var contView = UIView().createCustomView()
        return contView
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
    private func addViews() {
        self.addSubview(loginContrainterView)
        self.addSubview(passwordContrainterView)
        self.addSubview(loginButton)
        self.addSubview(continueView)
        self.addSubview(googleButton)
        self.addSubview(registerView)
        
        registerView.addSubview(noAccauntLabel)
        registerView.addSubview(registerButton)
        
        loginContrainterView.addSubview(loginLabel)
        loginContrainterView.addSubview(loginTextField)
        
        passwordContrainterView.addSubview(passwordLabel)
        passwordContrainterView.addSubview(passwordTextField)
    }
    
    private func setupConstraints() {
        loginContrainterView.snp.makeConstraints { make in
            make.height.equalTo(70)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.top.equalToSuperview().offset(120)
        }
        
        passwordContrainterView.snp.makeConstraints { make in
            make.height.equalTo(70)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.top.equalTo(loginContrainterView.snp.bottom).offset(12)
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
            make.top.equalTo(passwordContrainterView.snp.bottom).offset(24)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(57)
        }
        
        continueView.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(38)
            make.centerX.equalToSuperview()
            make.height.equalTo(30)
            make.width.equalTo(300)
        }
        
        googleButton.snp.makeConstraints { make in
            make.top.equalTo(continueView.snp.bottom).offset(60)
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
    // метод для создания label
    private func setupCustomLabel(text: String, fontSize: Int) -> UILabel {
        let customLabel = UILabel()
        customLabel.text = text
        customLabel.textColor = #colorLiteral(red: 0.4863581657, green: 0.4862256646, blue: 0.4821705818, alpha: 1)
        customLabel.font = UIFont.systemFont(ofSize: CGFloat(fontSize))
        return customLabel
    }
    
    // метод для создания textField
    private func setupCustomTextField(with placeholder: String) -> UITextField {
        let customTF = UITextField()
            .createCustomTextField(placeholder: placeholder)
        customTF.layer.cornerRadius = 13
        customTF.layer.borderColor = UIColor.systemGray5.cgColor
        customTF.layer.borderWidth = 1
        customTF.backgroundColor = #colorLiteral(red: 0.984313786, green: 0.984313786, blue: 0.9843136668, alpha: 1)
        customTF.isSecureTextEntry = false
        return customTF
    }
    
    /*
     Метот для создания view которое помещаемся справа в textField, чтобы сделать
     отступ
     */
    private func createRightViewForTF() -> UIView {
        let rightView = UIView()
        rightView.frame = CGRect(x: 0, y: 0, width: 50, height: 40)
        
        let eyeButton = createEyeButton()
        rightView.addSubview(eyeButton)
        
        return rightView
    }
    
    // метод для создания кнопки глаза для textField
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
