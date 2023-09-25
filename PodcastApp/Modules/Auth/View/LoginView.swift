//
//  LoginView.swift
//  PodcastApp
//
//  Created by Kirill Taraturin on 25.09.2023.
//

import UIKit

final class LoginView: UIView {
    
    // MARK: - UI Properties
    private lazy var loginStackView: UIStackView = {
        var loginStackVIew = UIStackView()
        loginStackVIew.backgroundColor = .green
        return loginStackVIew
    }()
    
    // MARK: - Login Properties
    
    lazy var loginLabel: UILabel = {
        var loginLabel = UILabel()
        return loginLabel
    }()
    
    lazy var loginTextField: UITextField = {
        var loginTF = UITextField()
        loginTF.placeholder = "Login"
        return loginTF
    }()
    
    // MARK: - Password Properties
    lazy var passwordLabel: UILabel = {
        var passwordLabel = UILabel()
        return passwordLabel
    }()
    
    lazy var passwordTextField: UITextField = {
        var passwordTF = UITextField()
        passwordTF.placeholder = "Password"
        return passwordTF
    }()
    
    // MARK: -  Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addSubview(loginStackView)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setupConstraints() {
        loginStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(140)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(250)
        }
    }
    
}
