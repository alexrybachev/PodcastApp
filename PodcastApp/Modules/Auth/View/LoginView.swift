//
//  LoginView.swift
//  PodcastApp
//
//  Created by Kirill Taraturin on 25.09.2023.
//

import UIKit

final class LoginView: UIView {
    
    // MARK: - Main StackView
    private lazy var mainStackView: UIStackView = {
        var mainStackView = UIStackView()
        mainStackView.backgroundColor = .green
        mainStackView.axis = .vertical
        mainStackView.distribution = .fillEqually
        return mainStackView
    }()
    
    private lazy var loginPropertieView: UIView = {
        var loginPropertieView = UIView()
        loginPropertieView.backgroundColor = .red
        return loginPropertieView
    }()
    
    // MARK: - Login Properties
    lazy var loginLabel: UILabel = {
        var loginLabel = UILabel()
        loginLabel.text = "Enter login"
        loginLabel.textColor = #colorLiteral(red: 0.4863581657, green: 0.4862256646, blue: 0.4821705818, alpha: 1)
        loginLabel.font = UIFont.systemFont(ofSize: 14)
        return loginLabel
    }()
    
    lazy var loginTextField: UITextField = {
        var loginTF = UITextField()
        loginTF.layer.cornerRadius = 15
        loginTF.layer.borderColor = UIColor.systemGray5.cgColor
        loginTF.layer.borderWidth = 1
        loginTF.backgroundColor = #colorLiteral(red: 0.984313786, green: 0.984313786, blue: 0.9843136668, alpha: 1)
        loginTF.isSecureTextEntry = false
        
        // устанавливаем цвет текста в placeholder
        let placeholderText = NSAttributedString(
            string: "Login",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
        loginTF.attributedPlaceholder = placeholderText
        
        // создаем отступ от левого края textField
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 40))
        loginTF.leftView = leftView
        loginTF.leftViewMode = .always
        
        
        return loginTF
    }()
    
    // MARK: - Password Properties
    lazy var passwordLabel: UILabel = {
        var passwordLabel = UILabel()
        passwordLabel.text = "Password"
        passwordLabel.textColor = #colorLiteral(red: 0.4863581657, green: 0.4862256646, blue: 0.4821705818, alpha: 1)
        passwordLabel.font = UIFont.systemFont(ofSize: 14)
        return passwordLabel
    }()
    
    lazy var passwordTextField: UITextField = {
        var passwordTF = UITextField()
        passwordTF.placeholder = "Password"
        return passwordTF
    }()
    
    lazy var eyeButton: UIButton = {
        var eyeButton = UIButton(type: .custom)
        eyeButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        eyeButton.tintColor = #colorLiteral(red: 0.6980392337, green: 0.6980391741, blue: 0.6980391741, alpha: 1)
        eyeButton.addTarget(
            self,
            action: #selector(togglePasswordVisibility),
            for: .touchUpInside
        )
        return eyeButton
    }()
    
    lazy var rightViewForTF: UIView = {
        var rightViewForTF = UIView()
        
        rightViewForTF.frame = CGRect(x: 0, y: 0, width: 50, height: 40)
        return rightViewForTF
    }()

    // MARK: -  Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addSubview(loginPropertieView)
        self.addSubview(loginTextField)
        
        rightViewForTF.addSubview(eyeButton)
        loginTextField.rightView = rightViewForTF
        loginTextField.rightViewMode = .always
        eyeButton.frame = CGRect(x: 10, y: 10, width: 23, height: 20)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Actions
    @objc func togglePasswordVisibility() {

        loginTextField.isSecureTextEntry.toggle()
           let image = loginTextField.isSecureTextEntry
           ? UIImage(systemName: "eye.slash.fill")
           : UIImage(systemName: "eye.fill")
           eyeButton.setImage(image, for: .normal)
       }
    
    // MARK: - Private Methods
    private func setupConstraints() {
        //        mainStackView.snp.makeConstraints { make in
        //            make.top.equalToSuperview().offset(140)
        //            make.left.equalToSuperview().offset(16)
        //            make.right.equalToSuperview().offset(-16)
        //            make.height.equalTo(180)
        //        }
        //
        //        loginPropertieView.snp.makeConstraints { make in
        //            make.height.equalTo(100)
        //            make.left.equalToSuperview().offset(16)
        //            make.right.equalToSuperview().offset(-16)
        //            make.top.equalToSuperview().offset(140)
        //        }
        loginTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(200)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(50)
        }

    }
}
